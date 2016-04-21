% it is the  entrance of program
%
% Example:
%  SetupGui
%
% Email: 498143049@qq.com
% Website: https://github.com/498143049/robotSimulate
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% log:
% 2016-04-21: Complete
function SetupGui
figure('Name','robot simulink','color',[0.9,0.9,0.9],'Unit','normalized','Position', [ 0.4538   0.4664   0.2031   0.1424]);
set(gcf,'menubar','none');
% add button to load file
uicontrol(gcf,'Style','pushbutton','Unit','normalized','Position',[0.3 0.3 0.4 0.4],'String','Load data','CallBack',{@Loadfile});
function  Loadfile(hObject, ~)
  global robot
  global Status  %Button status
  Status=0;
  [f]=uigetfile('*.json','chose one file');
  robot=loadData(f);
  delete (hObject);  %删除LOAD按键
  %开始分析数据   得到有几个可以转动的结构，以及物体的运动范围。动态确定其值
  %开始分析分析出有几个活动关节，以及关节的编号
  gui(robot.ActionjointNum);  %create界面
  init_gui();                 %初始化界面