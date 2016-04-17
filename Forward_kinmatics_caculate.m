%    根据通过robot设置的DH参数。
%     进行DH的坐标运算
%     其值应该等于其DH参数，然后乘以自己的移动量
function Forward_kinmatics_caculate()
  global robot
  spoint=[0,0,0,1];  %计算其点
   robot.link{1,1}.dot=robot.link{1,1}.v(:,1:3);
   Told=eye(4);                        %生成单位矩阵
  for i=robot.Actionjoint
    Told=Told*tmat(robot.link{1, i}.DHParametes);
    robot.link{1,i}.dot=((Told*robot.link{1,i}.v')');
    robot.link{1,i}.dot=robot.link{1,i}.dot(:,1:3);
  end
  spoint=((Told*spoint')');
  robot.spoint=spoint(1:3);

end 
 % 获取齐次方程（旋转）
 % 通过DH参数获取变换矩阵
 % 变换矩阵为
 %     C     -S    0    a
 %     sca  cca   -sa  -sa*d
 % T=  ssa  csa   ca    ca*d
 %      0     0    0     1
 %  通过其杆的连续变换，即可以得到结果 这是改进式的DH参数
 function T = tmat(Dhparametes)
	c = cosd(Dhparametes.theta);
  s = sind(Dhparametes.theta);
  ca = cosd(Dhparametes.alpha);
  sa = sind(Dhparametes.alpha);
  T = [c -s 0 Dhparametes.A; s*ca c*ca -sa -sa*Dhparametes.D; s*sa c*sa ca ca*Dhparametes.D; 0 0 0 1]; 
end