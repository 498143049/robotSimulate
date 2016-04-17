% 初始化GUI界面的设置其初始化时通过全局变量ROBOT来实现
%里面也包含函数的绑定
function init_gui()
   global robot;
   %修改标题
   handles = getappdata(0,'picAxes');
   set(handles,'String',[robot.RobotName,'   robot']);
   %create Pic pannel
   Forward_kinmatics_caculate();
   draw();
   %create Parameters pannel
   Dh= getappdata(0,'Dh');
   t1_min= getappdata(0,'t1_min');
   t1_max= getappdata(0,'t1_max');
   t_slider= getappdata(0,'t_slider');
   t1_edit= getappdata(0,'t1_edit');
   button= getappdata(0,'Load_button');
  Text=getappdata(0,'h_text');
  for i=1:robot.ActionjointNum 
  	%生成DH参数
  	filedsName=fieldnames(robot.link{1, robot.ActionjointNum(1)}.DHParametes); %get the filed of DH paramets
  	for j=1:length(filedsName)
  	   set(Dh(i,j),'String',getfield(robot.link{1, robot.Actionjoint(i)}.DHParametes,char(filedsName(j))))
	end
	set(t_slider(i),'Max',robot.link{1, robot.Actionjoint(i)}.RANGE.max,'Min',robot.link{1, robot.Actionjoint(i)}.RANGE.min);
	set(t1_min(i),'String',robot.link{1, robot.Actionjoint(i)}.RANGE.min);
	set(t1_max(i),'String',robot.link{1, robot.Actionjoint(i)}.RANGE.max);
	 %绑定操作函数 slider and edit 
	set(t_slider(i),'callback',{@slider_button_press});
	set(t1_edit(i),'callback',{@edit_button_press});
	
  end
  set(button,'callback',{@inverse_button_press});
  set(Text(2),'callback',{@Control_button_press});

  %inserve kinematics 
  KN_editold=getappdata(0,'KN_editold');
  for i=1:3
  	set(KN_editold(i),'String',robot.spoint(i));
  end
end
% 绘制函数
function  draw()
  global robot
  for i=1:length(robot.link) 
    L(i)=patch('Faces',robot.link{1,i}.f,'Vertices',robot.link{1,i}.dot,'FaceColor',[robot.link{1,i}.color.r/255    robot.link{1,i}.color.g/255    robot.link{1,i}.color.b/255],'LineStyle','none','SpecularExponent',20);
  end
  H=plot3(0,0,0,'color',[robot.link{1,robot.ActionjointNum}.color.r/255    robot.link{1,robot.ActionjointNum }.color.g/255    robot.link{1,robot.ActionjointNum }.color.b/255],'LineWidth',2);
  setappdata(0,'patch_h',L); %保存句柄
  setappdata(0,'plot3',H); %保存句柄
end
%更新界面操作
function UpdatePanle()
 %更新显示DH参数面板 和正运动学面板
 global robot;
 Dh= getappdata(0,'Dh');
 t_slider= getappdata(0,'t_slider');
 t1_edit= getappdata(0,'t1_edit');
  for i=1:robot.ActionjointNum
    if strcmpi(robot.link{1, robot.Actionjoint(i)}.type,'rotating') 
      set(Dh(i,4),'String',robot.link{1, robot.Actionjoint(i)}.DHParametes.theta);
      set(t_slider(i),'Value',robot.link{1, robot.Actionjoint(i)}.DHParametes.theta);
      set(t1_edit(i),'String',robot.link{1, robot.Actionjoint(i)}.DHParametes.theta);
    else
      set(Dh(i,4),'String',robot.link{1, robot.Actionjoint(i)}.DHParametes.D);
      set(t_slider(i),'Value',robot.link{1, robot.Actionjoint(i)}.DHParametes.D);
      set(t1_edit(i),'String',robot.link{1, robot.Actionjoint(i)}.DHParametes.D);
    end
  end 
  %update inserve kinematics 
  KN_editold=getappdata(0,'KN_editold');
  for i=1:3
  	set(KN_editold(i),'String',robot.spoint(i));
  end
end
%滑块滑动的手的标签
function slider_button_press(obj,evnt)
  global robot
  t_slider= getappdata(0,'t_slider');
  Target=get(t_slider,'Value');
  Target=cell2mat(Target);
  move(Target,10);
  UpdatePanle();
end
%按键程序的绑定
function edit_button_press(obj,evnt)
	global robot
	t1_edit= getappdata(0,'t1_edit');
	Target=get(t1_edit,'String');
	Target=str2num(char(Target));
	move(Target,10);
	UpdatePanle();
end 
function inverse_button_press(~,~)
   global robot;
   setValue=getappdata(0,'KN_editnow');
   x=str2double(get(setValue(1),'String'));
   y=str2double(get(setValue(2),'String'));
   z=str2double(get(setValue(3),'String'));
   [cd,Status]=inverse_kinematics_Scara(x,y,z);
   if Status
     move(cd,10);
     UpdatePanle();
   else
      errordlg('Wanging','There is no Answer！！！');     
   end
end
function Control_button_press(~,~)
  global Status;
  Text=getappdata(0,'h_text'); 
  if(Status==0)
    Status=1;
    set(Text(2),'BackgroundColor',[0.2196    0.4510    0.6980]);
    set(Text(2),'ForegroundColor','black');
    rotate3d on;
  else
    Status=0;
    set(Text(2),'BackgroundColor',[0.2745    0.5608    0.8706]);
    set(Text(2),'ForegroundColor','white');
    rotate3d off;
  end
end