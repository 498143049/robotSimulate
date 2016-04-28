	syms x y z
	syms t1 t2 t3 t4 t5 t6
	robot=loadData('ABB1200config.json')
	robot.link{1, 2}.DHParametes.theta=t1;
	robot.link{1, 3}.DHParametes.theta=t2;
	robot.link{1, 4}.DHParametes.theta=t3;
	robot.link{1, 5}.DHParametes.theta=t4;
	robot.link{1, 6}.DHParametes.theta=t5;
	robot.link{1, 7}.DHParametes.theta=t6;
	%x=-100;y=200;z=500;
	%t1=atan(y/x);
	robot.link{1, 2}.DHParametes.theta=t1;
	x_6=tmat_in(robot.link{1, 2}.DHParametes)*tmat_in(robot.link{1, 3}.DHParametes)*tmat_in(robot.link{1, 4}.DHParametes)*tmat_in(robot.link{1, 5}.DHParametes)*tmat_in(robot.link{1, 6}.DHParametes)*tmat_in(robot.link{1, 7}.DHParametes);
	x_5=tmat_in(robot.link{1, 2}.DHParametes)*tmat_in(robot.link{1, 3}.DHParametes)*tmat_in(robot.link{1, 4}.DHParametes)*tmat_in(robot.link{1, 5}.DHParametes)*tmat_in(robot.link{1, 6}.DHParametes);
	x_4=tmat_in(robot.link{1, 2}.DHParametes)*tmat_in(robot.link{1, 3}.DHParametes)*tmat_in(robot.link{1, 4}.DHParametes)*tmat_in(robot.link{1, 5}.DHParametes);
	x_3=tmat_in(robot.link{1, 2}.DHParametes)*tmat_in(robot.link{1, 3}.DHParametes)*tmat_in(robot.link{1, 4}.DHParametes);
	x_2=tmat_in(robot.link{1, 2}.DHParametes)*tmat_in(robot.link{1, 3}.DHParametes);
	x_1=tmat_in(robot.link{1, 2}.DHParametes);

	c=[1,0,0,x;0,1,0,y;,0,0,-1,z;0,0,0,1];

	y_1=inv(tmat_in(robot.link{1, 2}.DHParametes))*c;
	z_1=tmat_in(robot.link{1, 3}.DHParametes)*tmat_in(robot.link{1, 4}.DHParametes)*tmat_in(robot.link{1, 5}.DHParametes)*tmat_in(robot.link{1, 6}.DHParametes)*tmat_in(robot.link{1, 7}.DHParametes);

	y_2=inv(tmat_in(robot.link{1, 3}.DHParametes))*inv(tmat_in(robot.link{1, 2}.DHParametes))*c;
	z_2=tmat_in(robot.link{1, 4}.DHParametes)*tmat_in(robot.link{1, 5}.DHParametes)*tmat_in(robot.link{1, 6}.DHParametes)*tmat_in(robot.link{1, 7}.DHParametes);
	


	y_3=inv(tmat_in(robot.link{1, 4}.DHParametes))*inv(tmat_in(robot.link{1, 3}.DHParametes))*inv(tmat_in(robot.link{1, 2}.DHParametes))*c;
	z_3=tmat_in(robot.link{1, 5}.DHParametes)*tmat_in(robot.link{1, 6}.DHParametes)*tmat_in(robot.link{1, 7}.DHParametes);

	eq1=y_1(1:3,4)==z_1(1:3,4)
	eq2=y_2(1:3,4)==z_2(1:3,4)
	eq3=y_3(1:3,4)==z_3(1:3,4)

	solx=solve(eq1,eq2,eq3,t2,t3,'Real',true);



x=[];
for i=1:4
	 x=[x,['x_' i]]
end

syms x_1 x_2 x_3 x_4 y_1 y_2 y_3 y_4 z_1 z_2 z_3 z_4 D_1 D_2 D_3 D_4
x_a=tmat_in( x_1,x_2,x_3,x_4);
x_b=tmat_in( y_1,y_2,y_3,y_4);
x_c=tmat_in( z_1,z_2,z_3,z_4);
x_D=tmat_in( D_1,D_2,D_3,D_4);
x_F=x_a*x_b*x_c*x_D