function [A,status]=inverse_kinematics_Abb1200(x,y,z)
% it gets joint value for ABB1200 it use  DH paramets from ABB1200config.json
%
% Example:
% 
% inverse_kinematics_Abb1200(x,y,z)
%  x,y,z the coordinate point 
% Email: 498143049@qq.com
% Website: https://github.com/498143049/robotSimulate
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% log:
% 2016-04-24: Complete
	global robot;
	status=1;
	% x=100,y=200,z=800;
	A=[0,0,0,0,0,0];
	if x~=0
		% if((y/x)>0)
	 %  		t1=[atand(y/x),atand(y/x)-180];
	 %  	else
	 %  		t1=[atand(y/x),atand(y/x)-180];
	 t1=atand(y/x);  %限定其范围在-90~90 之间
	else
		if(y>0)
	  		t1=90;
	  	else
	  		t1=-90;
	  	end
	end
	% t1 %维度不需要检查范围
	L1=z-407;
	L2=x*cosd(t1)+y*sind(t1);
	d1=(518^2+L1.^2+L2.^2-452^2)./(2*518*sqrt(L1.^2+L2.^2));
	% d1=(518^2+L1^2+L2^2-452^2)/(2*518*sqrt(L1^2+L2^2));
	d1Length=length(d1);
	for i=1:d1Length
	  if(d1(i)<-1||d1(i)>1)
		d1(i)=[];
	  end
	end
	if(length(d1)<1)
		status=0;
		return;           %判断无解
	end

	if(L1~=0)           %限定fai的范围为-90~90 之间
		fai=atand(L2/L1);
	else
		fai=90;
	end
	temp=[asind(d1),180-asind(d1)]; %找到2个角度
	t2=temp-fai;       %180-asind(d)-fai   0~180;
	num=[];
	for i=1:length(t2)            %增加约束条件t2的范围在0~180之间
	  if(t2(i)<0||t2(i)>180)
		num=[num,i];
	  end
	end
	t2(num)=[];
	if(length(t2)<1)
		status=0;
		return;
	end

	%保证其中之二的维度
	d2=((z*cosd(t2)) - (407* cosd(t2)) - (x*cosd(t1)*sind(t2)) - (y*sind(t1)*sind(t2)))/452;

	for i=1:length(d2)
	  if(d2(i)<-1||d2(i)>1)
		d2(i)=[];
	  end
	end
	if(length(d2)<1)
		status=0;
		return;           %判断无解
	end

	t3=-acosd(d2);           %0~-180 这是单调的
	acd=ones(length(t3)*length(t2),3);
	for i=1:length(t3)
		for j=1:length(t2)
			acd(2*i+j-2,:)=[t1,t2(j),t3(i)];
		end
	end 
	[a,b]=size(acd)
	value=ones(a,3);
	for i=1:a
		value(i,1)=518*cosd(acd(i,2)) - x*cosd(acd(i,1))  - y*sind(acd(i,1))-452*sind(acd(i,2) + acd(i,3));
		value(i,2)=y*cosd(acd(i,1)) - x*sind(acd(i,1));
		value(i,3)=518*sind(acd(i,2)) + 452*cosd(acd(i,2) + acd(i,3))-z+407;
	end
	value(find(abs(value)<2))=0;
	[row, col] = find(value)
	rownum= unique(row);
	for i=rownum
		acd(i,:)=[];
	end
	if(length(acd)<1)
		status=0;
		return;
	end
	OldValue=robot.link{1, robot.Actionjoint(1)}.DHParametes.theta;
	absarry=abs(acd(:,1)-OldValue);
	position=find(absarry==min(absarry),1,'first');
    A(1)=acd(position,1);
    A(2)=acd(position,2);
    A(3)=acd(position,3);
end
