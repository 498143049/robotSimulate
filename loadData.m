function data = loadData(path)
% it loaded the config.json; it prase the json file into matlab structure
%
% path:the path of files
% Example:
%   move([0,0,0,0],10)
%
% NOTE: it contains fileds :orgin point ,point num ,statustype(roate,base,transform),color,DHparametes and limited Values
%
% Email: 498143049@qq.com
% Website: https://github.com/498143049/robotSimulate
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% log:
% 2016-04-21: Complete
	fid = fopen(path,'rt');
	inString = fscanf(fid,'%c');
	fclose(fid);
	data = p_json(inString);
	Num=length(data.link);
	ActionjointNum=0;
	Actionjoint=[];
	for i=1: Num
	[data.link{1,i}.v,data.link{1,i}.f,data.link{1,i}.Num]=stlread([strtrim(data.link{1,i}.fileName)]);
	[data.link{1,i}.v]=[data.link{1,i}.v,ones(data.link{1,i}.Num*3,1)];   %给其增加一列使其变为向量
		if ~strcmpi(data.link{1, i}.type,'base')
			ActionjointNum=ActionjointNum+1;	
			Actionjoint=[Actionjoint,i];
		end
	end
	 	data.ActionjointNum=ActionjointNum;
		data.Actionjoint=Actionjoint;
end

