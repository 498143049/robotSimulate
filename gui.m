function gui(num)
% it set up the mian gui ,it dynamicly sets up a mian GUI denpened on  degree of freedoms    
% num:the degree of freedoms  
% Example:
%  gui(6)
%
% NOTE: it position is auto to the mian figure 
%
% Email: 498143049@qq.com
% Website: https://github.com/498143049/robotSimulate
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% log:
% 2016-04-21: Complete
 

  % Main_figure = figure('Name','robot','color',[0.9,0.9,0.9],'Unit','normalized','Position', [ 0.4538   0.4664   0.2031   0.1424]);
  % set(gcf,'menubar','none');
  set(gcf,'Position',[0.05,0.05,0.9,0.9]);  

  %create four panel to display four block 
  picAxes=uicontrol(gcf,'unit','normalized','FontName','MicrosoftYaHei','FontUnits','normalized','style','text','String','Robot','Position',[0.033 0.935 0.7 0.04],'FontSize',0.8,'BackgroundColor',[ 0.2745    0.5608    0.8706],'ForegroundColor','white','FontWeight','bold'); 
  K_pic = uipanel(gcf,'BackgroundColor','white','units','normalized','Position',[0.033 0.025 0.7 0.91],'FontSize',11,'ShadowColor','white');
  uicontrol(gcf,'unit','normalized','FontName','MicrosoftYaHei','FontUnits','normalized','style','text','String','DH  Parametes','Position',[0.764 0.935 0.2 0.04],'FontSize',0.7,'BackgroundColor',[ 0.2745    0.5608    0.8706],'ForegroundColor','white'); 
  K_DH = uipanel(gcf,'BackgroundColor','white','units','normalized','Position',[0.764 0.735 0.20 0.2],'FontSize',11,'ShadowColor','white');
  uicontrol(gcf,'unit','normalized','FontName','MicrosoftYaHei','FontUnits','normalized','style','text','String','Kinematics','Position',[0.764 0.665 0.2 0.04],'FontSize',0.7,'BackgroundColor',[ 0.2745    0.5608    0.8706],'ForegroundColor','white'); 
  K_p = uipanel(gcf,'BackgroundColor','white','units','normalized','Position',[0.764 0.415 0.20 0.25],'FontSize',11,'ShadowColor','white');
  uicontrol(gcf,'unit','normalized','FontName','MicrosoftYaHei','FontUnits','normalized','style','text','String','Inverse  Kinematics','Position',[0.764 0.335 0.2 0.04],'FontSize',0.7,'BackgroundColor',[ 0.2745    0.5608    0.8706],'ForegroundColor','white'); 
  K_N = uipanel(gcf,'BackgroundColor','white','units','normalized','Position',[0.764 0.075 0.20 0.27],'FontSize',11,'ShadowColor','white');
  
  %This is pic 
  h_axes=axes('parent',K_pic,'unit','normalized','FontUnits','normalized','FontSize',0.02,'FontName','MicrosoftYaHei');  %»­³ö×ø±êÖáÏß
  % h_text(1)= uicontrol('parent',K_pic,'unit','normalized','FontName','MicrosoftYaHei','FontUnits','normalized','style','text','Position',[0.78 0.9 0.18 0.05],'FontSize',0.8,'BackgroundColor',[ 0.2196    0.4510    0.6980]); 
  h_text(2)= uicontrol('parent',K_pic,'unit','normalized','FontName','MicrosoftYaHei','FontUnits','normalized','style','pushbutton','String','Observed','Position',[0.782 0.903 0.176 0.044],'FontSize',0.8,'BackgroundColor',[ 0.2745    0.5608    0.8706],'ForegroundColor','white'); 
  set(h_axes,'position',[0.04,0.04,0.92,0.92]);
  hold on
  daspect([2 2 1])  ;                  % Setting the aspect ratio
  xlabel('X'),ylabel('Y'),zlabel('Z');
  % axis([-1000 1000 -1000 1000 0 1000]);
   % axis AUTO

  set(h_axes,'Box','off');
  grid on;
  %calculate pix in order to dynamic arrangement；
  pix=2*num-1;
  if(pix>9)
    pix=0.1;
    blankpix=(0.9-num*pix)/(num-1); 
  else
    pix=0.9/pix;
    blankpix=pix;
  end

  %kinenamatics
  % Dh=zeros(num,4);
  % t1_min=zeros(num);
  % t_slider=zeros(num);
  % t1_max=zeros(num);
  % t1_edit=zeros(num);
  for i=1:num
    for j=1:4
      Dh(i,j)=uicontrol(K_DH,'unit','normalized','FontUnits','normalized','style','text','String','0','Position',[0.05+0.25*(j-1) 0.95-(blankpix)*(i-1)-pix*i 0.15 pix],'FontSize',0.7,'BackgroundColor','white'); 
    end
    t1_min(i) = uicontrol(K_p,'FontUnits','normalized','unit','normalized','style','text','String',100,'Position',[0.05 0.95-(blankpix)*(i-1)-pix*i 0.11 pix],'FontSize',0.5,'BackgroundColor','white');
    t_slider(i) =uicontrol(K_p,'style','slider','unit','normalized','Max',100,'Min',0,'Value',0,'SliderStep',[0.05 0.2],'Position',[0.185 0.95-(blankpix)*(i-1)-pix*i 0.4 pix],'BackgroundColor','white');
    t1_max(i) = uicontrol(K_p,'FontUnits','normalized','unit','normalized','style','text','String',100,'Position',[0.585 0.95-(blankpix)*(i-1)-pix*i 0.15 pix],'FontSize',0.5,'BackgroundColor','white'); 
    uicontrol(K_p,'FontUnits','normalized','unit','normalized','style','text','String','V:','Position',[0.705 0.95-(blankpix)*(i-1)-pix*i 0.1 pix],'BackgroundColor','white','FontSize',0.7);
    t1_edit(i) = uicontrol(K_p,'FontUnits','normalized','unit','normalized','style','edit','String',0,'Position',[0.805 0.95-(blankpix)*(i-1)-pix*i 0.18 pix],'FontSize',0.5,'BackgroundColor','white');  
  end
   %select axes part
   axes(h_axes);                            
   %inverse kinematics
   Load_button = uicontrol(K_N,'FontUnits','normalized','Style','pushbutton','Unit','normalized','Position',[0.3 0.05 0.4 0.15],'String','Start','FontSize',0.8,'BackgroundColor',[0.2745    0.5608    0.8706],'ForegroundColor','white');
   uicontrol(K_N,'FontUnits','normalized','unit','normalized','style','text','String','Crruent','Position',[0 0.805 1 0.12],'FontSize',0.8,'ForegroundColor',[0.1333 0.2627 0.3922],'BackgroundColor','white'); 
   
   uicontrol(K_N,'FontUnits','normalized','unit','normalized','style','text','String','X :','Position',[0.05 0.675 0.09 0.10],'FontSize',0.8,'BackgroundColor','white'); 
   KN_editold(1)=uicontrol(K_N,'FontUnits','normalized','unit','normalized','style','text','String','0.0010','Position',[0.14 0.675 0.21 0.10],'FontSize',0.8,'BackgroundColor','white'); 
   uicontrol(K_N,'FontUnits','normalized','unit','normalized','style','text','String','Y:','Position',[0.35 0.675 0.09 0.1],'FontSize',0.8,'BackgroundColor','white'); 
   KN_editold(2)=uicontrol(K_N,'FontUnits','normalized','unit','normalized','style','text','String','100','Position',[0.44 0.675 0.21 0.10],'FontSize',0.8,'BackgroundColor','white'); 
   uicontrol(K_N,'FontUnits','normalized','unit','normalized','style','text','String','Z:','Position',[0.65 0.675 0.09 0.10],'FontSize',0.8,'BackgroundColor','white'); 
   KN_editold(3)=uicontrol(K_N,'FontUnits','normalized','unit','normalized','style','text','String','100','Position',[0.74 0.675 0.21 0.10],'FontSize',0.8,'BackgroundColor','white'); 

   uicontrol(K_N,'FontUnits','normalized','unit','normalized','style','text','String','Setting','Position',[0 0.44 1 0.12],'FontSize',0.8,'ForegroundColor',[0.1333 0.2627 0.3922],'BackgroundColor','white'); 
   
   uicontrol(K_N,'FontUnits','normalized','unit','normalized','style','text','String','X:','Position',[0.05 0.285 0.09 0.10],'FontSize',0.8,'BackgroundColor','white'); 
   KN_editnow(1)=uicontrol(K_N,'FontUnits','normalized','unit','normalized','style','edit','String','0','Position',[0.14 0.285 0.21 0.10],'FontSize',0.8,'BackgroundColor','white'); 
   uicontrol(K_N,'FontUnits','normalized','unit','normalized','style','text','String','Y:','Position',[0.35 0.285 0.09 0.10],'FontSize',0.8,'BackgroundColor','white'); 
   KN_editnow(2)=uicontrol(K_N,'FontUnits','normalized','unit','normalized','style','edit','String','0','Position',[0.44 0.285 0.21 0.10],'FontSize',0.8,'BackgroundColor','white'); 
   uicontrol(K_N,'FontUnits','normalized','unit','normalized','style','text','String','Z:','Position',[0.65 0.285 0.09 0.10],'FontSize',0.8,'BackgroundColor','white'); 
   KN_editnow(3)=uicontrol(K_N,'FontUnits','normalized','unit','normalized','style','edit','String','0','Position',[0.74 0.285 0.21 0.10],'FontSize',0.8,'BackgroundColor','white'); 
   
  %save object 
  setappdata(0,'KN_editnow',KN_editnow);
  setappdata(0,'KN_editold',KN_editold);

  setappdata(0,'t_slider',t_slider);  %保存其句柄的值
  setappdata(0,'t1_edit',t1_edit);    %编辑句柄
  setappdata(0,'t1_min',t1_min);    %编辑句柄
  setappdata(0,'t1_max',t1_max);    %编辑句柄
  

  setappdata(0,'Dh',Dh);    %数字显示句柄
  setappdata(0,'Load_button',Load_button);
  setappdata(0,'picAxes',picAxes); %Add pictitle

  setappdata(0,'h_text',h_text); %Add contral

end