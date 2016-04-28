function chgicon(hfig,iconfile)
%CHGICON changes the Figure HFIG's icon to the icon specified by ICONFILE
% HFIG must be a figure handle.
% ICONFILE is a string specifies the path to an imagefile.
%
%WARNING:
% Changing the MATLAB icon violates Mathworks license agreement. THis function can
% only be used for study purpose. Please delete it within 24 hours.
%
% Author: junziyang (simwer@126.com)
% Ver.1.0
% 2009-05-20
error(nargchk(2,2,nargin));
if ~ishandle(hfig) && ~isequal(get(hfig,'Type'),'figure')
    error('The first input argument must be a Figure handle.');
end
if ~ischar(iconfile) || ~exist(iconfile,'file')
    error('Icon file name is not input properly.');
end
mde = com.mathworks.mde.desk.MLDesktop.getInstance;
if isequal(get(hfig,'NumberTitle'),'off') && isempty(get(hfig,'Name'))
    figTag = 'junziyang'; %Name the figure temporarily
    set(hfig,'Name',figTag);
elseif isequal(get(hfig,'NumberTitle'),'on') && isempty(get(hfig,'Name'))
    figTag = ['Figure ',num2str(hfig)];
elseif isequal(get(hfig,'NumberTitle'),'off') && ~isempty(get(hfig,'Name'))
    figTag = get(hfig,'Name');
else
    figTag = ['Figure ',num2str(hfig),': ',get(hfig,'Name')];
end
drawnow %Update figure window
jfig = mde.getClient(figTag); %Get the underlying JAVA object of the figure.
jfig.setClientIcon(javax.swing.ImageIcon(iconfile));
if isequal(get(hfig,'Name'),'junziyang')
    set(hfig,'Name',''); 
end