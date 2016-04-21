function move(TagetValue,time)
% it moved the robot manipulate and control the time 
%
% move(TagetValue,time)
% TargetValue:The seted joint Value
% Time:Times of division  if you want to get more delicate route ,you must set biger num than older;
% Example:
%   move([0,0,0,0],10)
%
% NOTE: the length of TagetValue,it depends on Degreed of freedom
%
% Email: 498143049@qq.com
% Website: https://github.com/498143049/robotSimulate
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% log:
% 2016-04-21: Complete
  global robot
  TagetValue=VerifyValue(TagetValue);
  arry=ones(robot.ActionjointNum,time);
  for i=1:robot.ActionjointNum
    if strcmpi(robot.link{1, robot.Actionjoint(i)}.type,'rotating')  
      arry(i,:)=linspace(robot.link{1,robot.Actionjoint(i)}.DHParametes.theta,TagetValue(i),time);
    else
      arry(i,:)=linspace(robot.link{1,robot.Actionjoint(i)}.DHParametes.D,TagetValue(i),time);
    end
  end
  ChaneArray(arry);  
end


%deal the oldValue and get set Arry
function ChaneArray(arry)
  global robot
  robot.pointarry=[;;]
  for i=1:length(arry)
  	for j=1:robot.ActionjointNum
     if strcmpi(robot.link{1, robot.Actionjoint(j)}.type,'rotating')  
   	     robot.link{1, robot.Actionjoint(j)}.DHParametes.theta=arry(j,i);
     else
         robot.link{1, robot.Actionjoint(j)}.DHParametes.D=arry(j,i);
     end 
   	end
    Forward_kinmatics_caculate();
    robot.pointarry=[robot.pointarry;robot.spoint];
    change();
    pause(0.05);
  end 
 end
%update the change of graphical
 function  change()
  global robot
  handles = getappdata(0,'patch_h'); 
  for i=robot.Actionjoint
    set(handles(i),'vertices',robot.link{1,i}.dot);
  end
  H=getappdata(0,'plot3'); 
  set(H,'XData',robot.pointarry(:,1),'YData',robot.pointarry(:,2),'ZData',robot.pointarry(:,3));
end

% it verified the value of jiont  between  the limit values written in config.json 
function TagetValue=VerifyValue(TagetValue)
  global robot;
  for i=1:robot.ActionjointNum
    if strcmpi(robot.link{1, robot.Actionjoint(i)}.type,'rotating') 
      if TagetValue(i)>robot.link{1,robot.Actionjoint(i)}.RANGE.max
          errordlg('There is Max','Wanging');       
          TagetValue(i)=robot.link{1,robot.Actionjoint(i)}.RANGE.max;
      elseif TagetValue(i)<robot.link{1,robot.Actionjoint(i)}.RANGE.min
          errordlg('There is Min','Wanging');     
          TagetValue(i)=robot.link{1,robot.Actionjoint(i)}.RANGE.min;
      end
    else
      if TagetValue(i)>robot.link{1,robot.Actionjoint(i)}.RANGE.max
          errordlg('There is Max','Wanging');     
          TagetValue(i)=robot.link{1,i}.RANGE.max;
      elseif TagetValue(i)<robot.link{1,robot.Actionjoint(i)}.RANGE.min
          errordlg('There is Min','Wanging');        
          TagetValue(i)=robot.link{1,robot.Actionjoint(i)}.RANGE.min;
      end
    end
  end
end