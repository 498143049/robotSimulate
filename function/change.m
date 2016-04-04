%%%通过传入的值进行改变并进行绘图
function none = change(robot,a)
	robot=change1(robot,a);
	robot=caculate(robot);
	draw(robot);

%%改变其参数 maltab是改变其值，引用传递，否则是值传递。因此此处需要优化
function robot = change1(robot,a)
	j=1;
	for i=1:5
	  if  strcmpi(robot.link{1, i}.type,'rotating')  %检测AJ的范围，并且如果大于其值则设为做大值，并发出警告！
		if a(j)>robot.link{1, i}.RANGE.max
			 warning('robot link %s more max ,Set its maximum value',i)
			 a(j)=robot.link{1, i}.RANGE.max;
		end 
		if a(j)<robot.link{1, i}.RANGE.min
			 warning('robot link %s less min ，Set its minimum value',i)
			 a(j)=robot.link{1, i}.RANGE.min;
		end 
		robot.link{1, i}.DHParametes.theta=a(j);
		j=j+1;
	  else if strcmpi(robot.link{1, i}.type,'translation')
	  		if a(j)>robot.link{1, i}.RANGE.max
			    warning('robot link %s more max,Set its maximum value ',i)
			    a(j)=robot.link{1, i}.RANGE.max;
			end 
			if a(j)<robot.link{1, i}.RANGE.min
			    warning('robot link %s less min，Set its minimum value',i)
			    a(j)=robot.link{1, i}.RANGE.min;
			end 
	  	robot.link{1, i}.DHParametes.D=a(j);
		j=j+1;
	  else
	  	continue;
       end
      end
   end
