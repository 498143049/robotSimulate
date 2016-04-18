
function gui(num)
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
   axes(h_axes);                            % add a default light
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
end