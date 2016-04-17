%移动标志位其中就是输出移动次数，以及目标移动的角度。
%如果是4个维度则TagetValt=[0,0,0,0] 的形式
%如果有6个活动关节则为[0,0,0,0,0,0] 的形式
%其最终目的是改变其点
function move(TagetValue,time)
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
% Finally.
function  change()
  global robot
  handles = getappdata(0,'patch_h'); 
  for i=robot.Actionjoint
    set(handles(i),'vertices',robot.link{1,i}.dot);
  end
  H=getappdata(0,'plot3'); 
  set(H,'XData',robot.pointarry(:,1),'YData',robot.pointarry(:,2),'ZData',robot.pointarry(:,3));
end

function ChaneArray(arry)
  global robot
  robot.pointarry=[;;];
  for i=1:length(arry)
  	for j=1:4
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
 %验证其值
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