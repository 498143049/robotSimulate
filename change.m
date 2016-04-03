
%%改变其参数 maltab是改变其值，引用传递，否则是值传递。因此此处需要优化
function robot = change1(robot,a)
	j=1;
	for i=1:5
	  if  strcmpi(robot.link{1, i}.type,'rotating')  %检测AJ的范围，并且如果大于其值则设为做大值，并发出警告！
		robot.link{1, i}.DHParametes.theta=a(j);
		j=j+1;
	  else if strcmpi(robot.link{1, i}.type,'translation')
	  	robot.link{1, i}.DHParametes.D=a(j);
		j=j+1;
	  else
	  	continue;
       end
      end
   end
