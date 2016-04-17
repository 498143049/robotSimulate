% 只是计算scala关节机器人的
function  [a,b,c]=Nscarath(x,y,z)
	global robot;
	A=(250^2-270^2+x^2+y^2)/(2*250*sqrt(x^2+y^2));
	G=atand(x/y);
	a=G-atand(A/sqrt(1-A^2));
	r=sqrt(x^2+y^2);
	b=acosd((r*sind(a+G)-250)/270);
	c=100-z;
	
	% 计算其公�?
