function SetupGui
Main_figure = figure('Name','robot','color','white','Unit','normalized','Position', [ 0.4538   0.4664   0.2031   0.1424])
set(gcf,'menubar','none');
%增加一个按键
Load_button = uicontrol(gcf,'Style','pushbutton','Unit','normalized','Position',[0.3 0.3 0.4 0.4],'String','Load data','CallBack',{@Loadfile});

function  Loadfile(~, ~)
 [f,p]=uigetfile('*.json','chose one file');
 set(gcf,'Position',[0.1,0.1,0.8,0.8]);
 h_axes=axes('parent',gcf,...
'unit','normalized','position',[0.1,0.15,0.55,0.7],...
'xlim',[0 15],'ylim',[0 1.8],'fontsize',8);
