 function T = tmat_in(Dhparametes)
% it create  Homogeneous equations by the D-H parametes
%
% Example:
%  tmat_in()
% it was used for test
%
% Email: 498143049@qq.com
% Website: https://github.com/498143049/robotSimulate
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% log:
% 2016-04-21: Complete
  c = cos(Dhparametes.theta);
  s = sin(Dhparametes.theta);
  ca = cosd(Dhparametes.alpha);
  sa = sind(Dhparametes.alpha);
  T = [c -s 0 Dhparametes.A; s*ca c*ca -sa -sa*Dhparametes.D; s*sa c*sa ca ca*Dhparametes.D; 0 0 0 1]; 
end