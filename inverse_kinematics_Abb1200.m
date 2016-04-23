function [A,status]=inverse_kinematics_Abb1200(x,y,z)
	global robot;
	status=1;
	% x=100,y=200,z=800;
	A=[0,0,0,0,0,0];
	if x~=0
		if((y/x)>0)
	  		t1=[atand(y/x),atand(y/x)-180];
	  	else
	  		t1=[atand(y/x),atand(y/x)-180];
	else
	  t1=90;
	end
	% t1 %维度不需要检查范围
	L1=z-407;
	L2=x*cosd(t1)+y*sind(t1);
	d1=(518^2+L1.^2+L2.^2-452^2)./(2*518*sqrt(L1.^2+L2.^2));
	% d1=(518^2+L1^2+L2^2-452^2)/(2*518*sqrt(L1^2+L2^2));
	d1Length=length(d1)
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
	t2Length=length(t2);
	for i=1:t2Length            %增加约束条件t2的范围在0~180之间
	  if(t2(i)<0||t2(i)>180)
		t2(i)=[];
	  end
	end
	if(length(t2)<1)
		status=0;
		return;
	end

	%保证其中之二的维度
	d2=((z*cosd(t2)) - (407* cosd(t2)) - (x*cosd(t1)*sind(t2)) - (y*sind(t1)*sind(t2)))/452;

	if(d2<-1||d2>1)
	   status=0;
	   return;
	end

	t3=-acosd(d2);           %0~-180 这是单调的
	A(1)=t1;
    A(2)=t2;
    A(3)=t3;

end