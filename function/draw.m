function ans =draw(robot)
	for i=1:5
		L(i)=patch('Faces',robot.link{1,i}.f,'Vertices',robot.link{1,i}.dot,'FaceColor',[ robot.link{1,i}.color.r/255    robot.link{1,i}.color.g/255    robot.link{1,i}.color.b/255],'LineStyle','none');
    end
    %设置观测角度
    setappdata(0,'patch_h',L); %保存句柄
function  change()
	handles = getappdata(0,'patch_h'); 
	for i=2:5
		set(L1,'vertices',robot.link{1,i}.dot,'facec', robot.link{1,i}.f);
	end
