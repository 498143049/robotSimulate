%函数同解
%直接给出公式：公式推导如胡杰 等：基于 SCARA 机器人的运动学分析及关节解耦  所示。
%其中的解决办法就是根据syms开始分析，得到其特解
function [A,status]=inverse_kinematics_Scara(x,y,z)
	global robot;
	c1=250;
	c2=270;
	status=1;
	A=[0,0,0,0];
	temp1=305-205-z; %检测Z值； %检测实数范围内;
	if(temp1>0 ||temp1<-175)
        status=0;
        return;
    end

	value=(x^2+y^2-c1^2-c2^2)/(2*c1*c2);   %由于其角度是150so其最大值不超过0.8660根号好2/2
	if(value<cosd(150)||value>1)
		status=0;
        return;
    end
	temp2_1=acosd(value);

	C=(250+270*value)/sqrt(x^2+y^2);
	if(C>1||C<-1)
		status=0;
        return;
	end
	temp3_1=asind(C)-atand(x/y);   %第一组解
	%第二组
	temp2_2=-temp2_1;
	temp3_2=180-asind(C)-atand(x/y);
	OldValue=robot.link{1, robot.Actionjoint(1)}.DHParametes.theta;
	if abs(temp3_1-OldValue)<abs(temp3_2-OldValue)
      A(1)=temp3_1;
      A(2)=temp2_1;
      A(3)=temp1;
    else
       A(1)=temp3_2;
       A(2)=temp2_2;
       A(3)=temp1;
     end
end