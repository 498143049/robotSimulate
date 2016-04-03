function ans =draw(robot)
	for i=1:5
		patch('Faces',robot.link{1,i}.f,'Vertices',robot.link{1,i}.dot,'FaceColor',[ robot.link{1,i}.color.r/255    robot.link{1,i}.color.g/255    robot.link{1,i}.color.b/255],'LineStyle','none');
		hold on
    end
    %设置观测角度
    view(16,6);
