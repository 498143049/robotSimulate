
function SetupGui
Main_figure = figure('Name','robot','color',[0.95,0.95,0.95],'Unit','normalized','Position', [ 0.4538   0.4664   0.2031   0.1424])
set(gcf,'menubar','none');
% add button to load file
Load_button = uicontrol(gcf,'Style','pushbutton','Unit','normalized','Position',[0.3 0.3 0.4 0.4],'String','Load data','CallBack',{@Loadfile});
function  Loadfile(hObject, ~)
  global robot
  [f,p]=uigetfile('*.json','chose one file')
  robot=loadData(f);
  delete (hObject);  %删除LOAD按键
  set(gcf,'Position',[0,0,1,1]);  %改变主窗口
  h_axes=axes('parent',gcf,'unit','normalized');  %画出坐标轴线
  set(h_axes,'position',[0,0.15,0.9,0.9]);
  hold on
  light                               % add a default light
  daspect([2 2 1])                    % Setting the aspect ratio
  view(145,35)
  xlabel('X'),ylabel('Y'),zlabel('Z');
  title(' Robotics SCALA');
  axis([-500 500 -500 500 0 500]);
  plot3([-500,500],[-500,-500],[0,0],'k')
  plot3([-500,-500],[-500,500],[-0,-0],'k')
  plot3([-500,-500],[-500,-500],[-0,500],'k')
  plot3([-500,-500],[500,500],[-0,500],'k')
  plot3([-500,500],[-500,-500],[500,500],'k')
  plot3([-500,-500],[-500,500],[500,500],'k')
  %create a pannel to contain it 
  % Kinematics Panel
  K_p = uipanel(gcf,'units','normalized','Position',[0.7 0.55 0.2 0.3],'Title','Kinematics','FontSize',11);

  num=getGuanjieshu();
  for i=1:4
    t_slider(i) =uicontrol(K_p,'style','slider','unit','normalized','Max',robot.robot.link{1, num(i)}.RANGE.max,'Min',robot.robot.link{1, num(i)}.RANGE.min,'Value',0,'SliderStep',[0.05 0.2],'Position',[0.1 0.8-0.2*(i-1) 0.8 0.1],'callback',{@slider_button_press,num(i)});
  end
  caculate();
  draw();

function num=getGuanjieshu()
  num=[2 3,4,5];
function slider_button_press(obj,evnt,num1)
  global robot
  % errordlg(['Minimum limit is ',num2str(num1),' degrees, using ',num2str(get(obj,'Value')),'.'],'Bad Input','modal')
  if strcmpi(robot.robot.link{1, num1}.type,'rotating') 
    robot.robot.link{1, num1}.DHParametes.theta=get(obj,'Value');
  else
    robot.robot.link{1, num1}.DHParametes.D=get(obj,'Value');
  end
  caculate();
  change();
%    根据通过robot设置的DH参数。
%     进行DH的坐标运算
function caculate()
  global robot
   robot.robot.link{1,1}.dot=robot.robot.link{1,1}.v(:,1:3);
   Told=eye(4);                        %生成单位矩阵
  for i=2:5
    Told=Told*tmat(robot.robot.link{1, i}.DHParametes);
    robot.robot.link{1,i}.dot=((Told*robot.robot.link{1,i}.v')');
    robot.robot.link{1,i}.dot=robot.robot.link{1,i}.dot(:,1:3);
  end
 % 获取齐次方程（旋转）
 % 通过DH参数获取变换矩阵
 % 变换矩阵为
 %     C     -S    0    a
 %     sca  cca   -sa  -sa*d
 % T=  ssa  csa   ca    ca*d
 %      0     0    0     1
 %  通过其杆的连续变换，即可以得到结果
function T = tmat(Dhparametes)
        Dhparametes.alpha = Dhparametes.alpha*pi/180;   
        Dhparametes.theta = Dhparametes.theta*pi/180;    
        c = cos(Dhparametes.theta);
        s = sin(Dhparametes.theta);
        ca = cos(Dhparametes.alpha);
        sa = sin(Dhparametes.alpha);
        T = [c -s 0 Dhparametes.A; s*ca c*ca -sa -sa*Dhparametes.D; s*sa c*sa ca ca*Dhparametes.D; 0 0 0 1]; 

function ans =draw()
  global robot
  for i=1:5
    L(i)=patch('Faces',robot.robot.link{1,i}.f,'Vertices',robot.robot.link{1,i}.dot,'FaceColor',[robot.robot.link{1,i}.color.r/255    robot.robot.link{1,i}.color.g/255    robot.robot.link{1,i}.color.b/255],'LineStyle','none');
  end
    %设置观测角度
    setappdata(0,'patch_h',L); %保存句柄
function  change()
  global robot
  handles = getappdata(0,'patch_h'); 
  for i=2:5
    set(handles(i),'vertices',robot.robot.link{1,i}.dot);
  end

