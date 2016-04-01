 % 获取齐次方程（旋转）
 % 通过DH参数获取变换矩阵
 % 变换矩阵为
 %     C     -S    0    a
 %     sca  cca   -sa  -sad
 % T=  ssa  csa   ca    cad
 %      0     0    0     1
 %  通过其杆的连续变换，即可以得到结果
function T = tmat(a,alpha, d, theta)
        alpha = alpha*pi/180;   
        theta = theta*pi/180;    
        c = cos(theta);
        s = sin(theta);
        ca = cos(alpha);
        sa = sin(alpha);
        T = [c -s 0 a; s*ca c*ca -sa -sa*d; s*sa c*sa ca ca*d; 0 0 0 1];