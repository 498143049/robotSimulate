%           读取数据 (返回数据)
%   里面包含的字段有  1.原始数据的点集合
%                    2.点的个数  pointNum
%                    3. 类型 Statustype
%                    4.颜色  
%                    5.DH参数
%                    6.极限值
function data = loadData(path)
	 fid = fopen(path,'rt');
	 inString = fscanf(fid,'%c');
	 fclose(fid);
	 data = p_json(inString);
	 Num=length(data.robot.link);
	 ActionjointNum=0;
	 Actionjoint=[];
	 for i=1: Num
		[data.robot.link{1,i}.v,data.robot.link{1,i}.f,data.robot.link{1,i}.Num]=stlread(['data/',strtrim(data.robot.link{1,i}.fileName)]);
		[data.robot.link{1,i}.v]=[data.robot.link{1,i}.v,ones(data.robot.link{1,i}.Num*3,1)];   %给其增加一列使其变为向量
		if ~strcmpi(data.robot.link{1, i}.type,'base')
			ActionjointNum=ActionjointNum+1;	
			Actionjoint=[Actionjoint,i];
		end
	 end
	 data.robot.ActionjointNum=ActionjointNum;
	 data.robot.Actionjoint=Actionjoint;

