function [A,status] =inverse_kinematics(x,y,z)
% it gets commom slouting to slove 
%
% but it waits to complete
% Example:
% 
% inverse_kinematics(x,y,z)
%  x,y,z the coordinate point 
% Email: 498143049@qq.com
% Website: https://github.com/498143049/robotSimulate
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% log:
% 2016-04-24: Complete
	global robot;
	syms a b c; 
	mem(1)=robot.link{1,robot.Actionjoint(1)}.DHParametes;
	mem(1).theta=a;
	mem(2)=robot.link{1,robot.Actionjoint(2)}.DHParametes;
	mem(2).theta=b;
	mem(3)=robot.link{1,robot.Actionjoint(3)}.DHParametes;
	mem(3).D=c;
  %只是给定前3个位变量
	xyz=tmat_in(mem)*tmat_in(mem2)*tmat_in(mem3)*tmat_in(robot.link{1, 5}.DHParametes);
	eq1=xyz(1,4)==x;
	eq2=xyz(2,4)==y;
	eq3=xyz(3,4)==z;
	solx=solve(eq1,eq2,eq3,a,b,c,'Real',true);
	A=[0,0,0,0];
	if(length(solx)==0)
		status=0;
    elseif(length(solx.a)==1)
        status=1;
        A(1)=subs(solx.a)*180/pi;
        A(2)=subs(solx.b)*180/pi;
        A(3)=subs(solx.c);
		A(4)=0;
       if(A(3)>0 || A(3)<-175)
           status=0;
            return;
        end
    elseif(length(solx.a)==2) 
		status=1;
        Value=subs(solx.a);
        OldValue=robot.link{1, 2}.DHParametes.theta;
        if abs(Value(1)-OldValue)<abs(Value(2)-OldValue)
            A(1)=subs(solx.a(1))*180/pi;
            A(2)=subs(solx.b(1))*180/pi;
            A(3)=subs(solx.c(1));
        else
            A(1)=subs(solx.a(2))*180/pi;
            A(2)=subs(solx.b(2))*180/pi;
            A(3)=subs(solx.c(2));
        end
        if(A(3)>0 || A(3)<-175)
           status=0;
            return;
        end
    end
end

 function T = tmat_in(Dhparametes)
  c = cos(Dhparametes.theta);
  s = sin(Dhparametes.theta);
  ca = cosd(Dhparametes.alpha);
  sa = sind(Dhparametes.alpha);
  T = [c -s 0 Dhparametes.A; s*ca c*ca -sa -sa*Dhparametes.D; s*sa c*sa ca ca*Dhparametes.D; 0 0 0 1]; 
end