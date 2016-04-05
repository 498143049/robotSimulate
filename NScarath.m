% 只是计算scala关节机器人的
function  [a,b,c,d]=Nscarath(x,y,z)
	A=(250^2-270^2+x^2+y^2)/(2*250*sqrt(x^2+y^2));
	G=atand(x/y);
	a=atand(A/sqrt(1-A^2))-G;
	r=sqrt(x^2+y^2);
	b=acosd((r*sind(a+G)-250)/270);
	c=z-70;
	d=0; 
	% 计算其公式
