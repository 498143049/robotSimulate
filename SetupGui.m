
function SetupGui
Main_figure = figure('Name','robot','color','white','Unit','normalized','Position', [ 0.4538   0.4664   0.2031   0.1424]);
set(gcf,'menubar','none');
% add button to load file
Load_button = uicontrol(gcf,'Style','pushbutton','Unit','normalized','Position',[0.3 0.3 0.4 0.4],'String','Load data','CallBack',{@Loadfile});
function  Loadfile(hObject, ~)
  global robot
  [f,p]=uigetfile('*.json','chose one file');
  robot=loadData(f);
  delete (hObject);  %删除LOAD按键
  %开始分析数据   得到有几个可以转动的结构，以及物体的运动范围。动态确定其值
  %开始分析分析出有几个活动关节，以及关节的编号

  set(gcf,'Position',[0,0,1,1]);  %改变主窗口
  K_pic = uipanel(gcf,'units','normalized','Position',[0.05 0.1 0.6 0.85],'Title','pic','FontSize',11);
  h_axes=axes('parent',K_pic,'unit','normalized','FontSize',11);  %画出坐标轴线
  set(h_axes,'position',[0.1,0.1,0.8,0.9]);
  hold on
  light                               % add a default light
  daspect([2 2 1])                    % Setting the aspect ratio
  view(125,25)
  xlabel('X'),ylabel('Y'),zlabel('Z');
  title('Robotics SCARA','FontWeight','bold','FontSize',16);           %名称也可以参数化
  axis([-500 500 -500 500 0 400]);
  set(h_axes,'Box','on');

  %create a pannel to contain it 
  % Kinematics Panel
  % K_DH = uipanel(gcf,'units','normalized','Position',[0.7 0.75 0.2 0.2],'Title','Dhparametes','FontSize',11);
  K_p = uipanel(gcf,'units','normalized','Position',[0.7 0.65 0.2 0.3],'Title','Kinematics','FontSize',11);
  K_N = uipanel(gcf,'units','normalized','Position',[0.7 0.35 0.2 0.25],'Title','N Kinematics','FontSize',11);
  filedsName=fieldnames(robot.robot.link{1, 2}.DHParametes);
  for i=1:robot.robot.ActionjointNum 
  	%%生成DH参数
 %    for j=1:4
 %    Dh(i,j)=uicontrol(K_DH,'unit','normalized','style','text','String', getfield(robot.robot.link{1, robot.robot.Actionjoint(i)}.DHParametes,char(filedsName(j))),'Position',[0.05+0.25*(j-1) 0.8-0.25*(i-1) 0.15 0.15],'FontSize',11); 
	% end
	t1_min(i) = uicontrol(K_p,'unit','normalized','style','text','String',robot.robot.link{1, robot.robot.Actionjoint(i)}.RANGE.min,'Position',[0.05 0.8-0.2*(i-1) 0.1 0.1]); 
	t_slider(i) =uicontrol(K_p,'style','slider','unit','normalized','Max',robot.robot.link{1, robot.robot.Actionjoint(i)}.RANGE.max,'Min',robot.robot.link{1, robot.robot.Actionjoint(i)}.RANGE.min,'Value',0,'SliderStep',[0.05 0.2],'Position',[0.15 0.8-0.2*(i-1) 0.5 0.1],'callback',{@slider_button_press,robot.robot.Actionjoint(i),i});
	t1_max(i) = uicontrol(K_p,'unit','normalized','style','text','String',robot.robot.link{1, robot.robot.Actionjoint(i)}.RANGE.max,'Position',[0.65 0.8-0.2*(i-1) 0.1 0.1]); 
	t1_edit(i) = uicontrol(K_p,'unit','normalized','style','edit','String',0,'callback',{@edit_button_press,robot.robot.Actionjoint(i),i},'Position',[0.85 0.8-0.2*(i-1) 0.1 0.1]); 
    t1_text(i) = uibutton(K_p,'unit','normalized','style','text','String',['\theta_',char(i+'0')],'Position',[0.75 0.8-0.2*(i-1) 0.1 0.1]); 
  end
  %增加逆运动学面板
  Load_button = uicontrol(K_N,'Style','pushbutton','Unit','normalized','Position',[0.3 0.05 0.4 0.2],'String','Start');

  uicontrol(K_N,'unit','normalized','style','text','String','setting','Position',[0 0.35 0.2 0.2],'FontSize',13); 
  uicontrol(K_N,'unit','normalized','style','text','String','X:','Position',[0.20 0.35 0.1 0.2],'FontSize',11); 
  KN_editnow(1) = uicontrol(K_N,'unit','normalized','style','edit','String',0,'Position',[0.3 0.40 0.15 0.2],'FontSize',13); 
  uicontrol(K_N,'unit','normalized','style','text','String','Y:','Position',[0.45 0.35 0.1 0.2],'FontSize',11); 
  KN_editnow(2) = uicontrol(K_N,'unit','normalized','style','edit','String',0,'Position',[0.55 0.40 0.15 0.2],'FontSize',13); 
  uicontrol(K_N,'unit','normalized','style','text','String','Z:','Position',[0.70 0.35 0.1 0.2],'FontSize',11); 
  KN_editnow(3) = uicontrol(K_N,'unit','normalized','style','edit','String',0,'Position',[0.8 0.40 0.15 0.2],'FontSize',13); 

  uicontrol(K_N,'unit','normalized','style','text','String','Crruent','Position',[0 0.7 0.2 0.2],'FontSize',13); 
  uicontrol(K_N,'unit','normalized','style','text','String','X:','Position',[0.20 0.7 0.1 0.2],'FontSize',11);
  KN_editold(1) = uicontrol(K_N,'unit','normalized','style','text','String',0,'Position',[0.3 0.7 0.15 0.2],'FontSize',13); 
  uicontrol(K_N,'unit','normalized','style','text','String','Y:','Position',[0.45 0.7 0.1 0.2],'FontSize',11); 
  KN_editold(2) = uicontrol(K_N,'unit','normalized','style','text','String',0,'Position',[0.55 0.7 0.15 0.2],'FontSize',13); 
  uicontrol(K_N,'unit','normalized','style','text','String','Z:','Position',[0.70 0.7 0.1 0.2],'FontSize',11); 
  KN_editold(3) = uicontrol(K_N,'unit','normalized','style','text','String',0,'Position',[0.8 0.7 0.15 0.2],'FontSize',13); 

  setappdata(0,'t_slider',t_slider);  %保存其句柄的值
  setappdata(0,'t1_edit',t1_edit);    %编辑句柄
  %%%增加值
  %uicontrol(K_p,'unit','normalized','style','text','String','Crruent','Position',[0.05 0.8-0.2*(i-1) 0.15 0.1]); 
  axes(h_axes);
  caculate();
  draw();

%滑块滑动的手的标签
function slider_button_press(obj,evnt,num1,sobj)
  global robot
  handles = getappdata(0,'t1_edit');
  % errordlg(['Minimum limit is ',num2str(num1),' degrees, using ',num2str(get(obj,'Value')),'.'],'Bad Input','modal')
  if strcmpi(robot.robot.link{1, num1}.type,'rotating') 
    arry=linspace(robot.robot.link{1, num1}.DHParametes.theta,get(obj,'Value'),10);
    set(handles(sobj),'String',get(obj,'Value'))
    ChaneArray(arry,num1,1);
  else
    arry=linspace(robot.robot.link{1, num1}.DHParametes.D,get(obj,'Value'),10);
    set(handles(sobj),'String',get(obj,'Value'))
    ChaneArray(arry,num1,0);
  end

function edit_button_press(obj,evnt,num1,sobj)
	global robot
	 handles = getappdata(0,'t_slider');
  % errordlg(['Minimum limit is ',num2str(num1),' degrees, using ',num2str(get(obj,'Value')),'.'],'Bad Input','modal')
  if strcmpi(robot.robot.link{1, num1}.type,'rotating') 
    arry=linspace(robot.robot.link{1, num1}.DHParametes.theta,str2double(get(obj,'String')),10);
    set(handles(sobj),'Value',str2double(get(obj,'String')));
    ChaneArray(arry,num1,1);
  else
    arry=linspace(robot.robot.link{1, num1}.DHParametes.D,str2double(get(obj,'String')),10);
    set(handles(sobj),'Value',str2double(get(obj,'String')));
    ChaneArray(arry,num1,0);
  end
%    根据通过robot设置的DH参数。
%     进行DH的坐标运算
function caculate()
  global robot
   robot.robot.link{1,1}.dot=robot.robot.link{1,1}.v(:,1:3);
   Told=eye(4);                        %生成单位矩阵
  for i=robot.robot.Actionjoint 
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
  for i=1:length(robot.robot.link) 
    L(i)=patch('Faces',robot.robot.link{1,i}.f,'Vertices',robot.robot.link{1,i}.dot,'FaceColor',[robot.robot.link{1,i}.color.r/255    robot.robot.link{1,i}.color.g/255    robot.robot.link{1,i}.color.b/255],'LineStyle','none');
  end
    %设置观测角度
    setappdata(0,'patch_h',L); %保存句柄

% Finally.
function  change()
  global robot
  handles = getappdata(0,'patch_h'); 
  for i=robot.robot.Actionjoint
    set(handles(i),'vertices',robot.robot.link{1,i}.dot);
  end
function ChaneArray(arry,num1,kind)
  global robot
  for i=1:length(arry)
    if kind 
      robot.robot.link{1, num1}.DHParametes.theta=arry(i);
    else
      robot.robot.link{1, num1}.DHParametes.D=arry(i);
    end 
    caculate();
    change();
    pause(0.05);
  end 
function [hout,ax_out] = uibutton(varargin)
        %uibutton: Create pushbutton with more flexible labeling than uicontrol.
        % Usage:
        %   uibutton accepts all the same arguments as uicontrol except for the
        %   following property changes:
        %
        %     Property      Values
        %     -----------   ------------------------------------------------------
        %     Style         'pushbutton', 'togglebutton' or 'text', default =
        %                   'pushbutton'.
        %     String        Same as for text() including cell array of strings and
        %                   TeX or LaTeX interpretation.
        %     Interpreter   'tex', 'latex' or 'none', default = default for text()
        %
        % Syntax:
        %   handle = uibutton('PropertyName',PropertyValue,...)
        %   handle = uibutton(parent,'PropertyName',PropertyValue,...)
        %   [text_obj,axes_handle] = uibutton('Style','text',...
        %       'PropertyName',PropertyValue,...)
        %
        % uibutton creates a temporary axes and text object containing the text to
        % be displayed, captures the axes as an image, deletes the axes and then
        % displays the image on the uicontrol.  The handle to the uicontrol is
        % returned.  If you pass in a handle to an existing uicontol as the first
        % argument then uibutton will use that uicontrol and not create a new one.
        %
        % If the Style is set to 'text' then the axes object is not deleted and the
        % text object handle is returned (as well as the handle to the axes in a
        % second output argument).
        %
        % See also UICONTROL.

        % Version: 1.6, 20 April 2006
        % Author:  Douglas M. Schwarz
        % Email:   dmschwarz=ieee*org, dmschwarz=urgrad*rochester*edu
        % Real_email = regexprep(Email,{'=','*'},{'@','.'})


        % Detect if first argument is a uicontrol handle.
        keep_handle = false;
        if nargin > 0
            h = varargin{1};
            if isscalar(h) && ishandle(h) && strcmp(get(h,'Type'),'uicontrol')
                keep_handle = true;
                varargin(1) = [];
            end
        end

        % Parse arguments looking for 'Interpreter' property.  If found, note its
        % value and then remove it from where it was found.
        interp_value = get(0,'DefaultTextInterpreter');
        arg = 1;
        remove = [];
        while arg <= length(varargin)
            v = varargin{arg};
            if isstruct(v)
                fn = fieldnames(v);
                for i = 1:length(fn)
                    if strncmpi(fn{i},'interpreter',length(fn{i}))
                        interp_value = v.(fn{i});
                        v = rmfield(v,fn{i});
                    end
                end
                varargin{arg} = v;
                arg = arg + 1;
            elseif ischar(v)
                if strncmpi(v,'interpreter',length(v))
                    interp_value = varargin{arg+1};
                    remove = [remove,arg,arg+1];
                end
                arg = arg + 2;
            elseif arg == 1 && isscalar(v) && ishandle(v) && ...
                    any(strcmp(get(h,'Type'),{'figure','uipanel'}))
                arg = arg + 1;
            else
                error('Invalid property or uicontrol parent.')
            end
        end
        varargin(remove) = [];

        % Create uicontrol, get its properties then hide it.
        if keep_handle
            set(h,varargin{:})
        else
            h = uicontrol(varargin{:});
        end
        s = get(h);
        if ~any(strcmp(s.Style,{'pushbutton','togglebutton','text'}))
            delete(h)
            error('''Style'' must be pushbutton, togglebutton or text.')
        end
        set(h,'Visible','off')

        % Create axes.
        parent = get(h,'Parent');
        ax = axes('Parent',parent,...
            'Units',s.Units,...
            'Position',s.Position,...
            'XTick',[],'YTick',[],...
            'XColor',s.BackgroundColor,...
            'YColor',s.BackgroundColor,...
            'Box','on',...
            'Color',s.BackgroundColor);
        % Adjust size of axes for best appearance.
        set(ax,'Units','pixels')
        pos = round(get(ax,'Position'));
        if strcmp(s.Style,'text')
            set(ax,'Position',pos + [0 1 -1 -1])
        else
            set(ax,'Position',pos + [4 4 -8 -8])
        end
        switch s.HorizontalAlignment
            case 'left'
                x = 0.0;
            case 'center'
                x = 0.5;
            case 'right'
                x = 1;
        end
        % Create text object.
        text_obj = text('Parent',ax,...
            'Position',[x,0.5],...
            'String',s.String,...
            'Interpreter',interp_value,...
            'HorizontalAlignment',s.HorizontalAlignment,...
            'VerticalAlignment','middle',...
            'FontName',s.FontName,...
            'FontSize',s.FontSize,...
            'FontAngle',s.FontAngle,...
            'FontWeight',s.FontWeight,...
            'Color',s.ForegroundColor);

        % If we are creating something that looks like a text uicontrol then we're
        % all done and we return the text object and axes handles rather than a
        % uicontrol handle.
        if strcmp(s.Style,'text')
            delete(h)
            if nargout
                hout = text_obj;
                ax_out = ax;
            end
            return
        end

        % Capture image of axes and then delete the axes.
        frame = getframe(ax);
        delete(ax)

        % Build RGB image, set background pixels to NaN and put it in 'CData' for
        % the uicontrol.
        if isempty(frame.colormap)
            rgb = frame.cdata;
        else
            rgb = reshape(frame.colormap(frame.cdata,:),[pos([4,3]),3]);
        end
        size_rgb = size(rgb);
        rgb = double(rgb)/255;
        back = repmat(permute(s.BackgroundColor,[1 3 2]),size_rgb(1:2));
        isback = all(rgb == back,3);
        rgb(repmat(isback,[1 1 3])) = NaN;
        set(h,'CData',rgb,'String','','Visible',s.Visible)

        % Assign output argument if necessary.
        if nargout
            hout = h;
        end
%%
  