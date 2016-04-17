 function T = tmat(Dhparametes)
  c = cos(Dhparametes.theta);
  s = sin(Dhparametes.theta);
  ca = cosd(Dhparametes.alpha);
  sa = sind(Dhparametes.alpha);
  T = [c -s 0 Dhparametes.A; s*ca c*ca -sa -sa*Dhparametes.D; s*sa c*sa ca ca*Dhparametes.D; 0 0 0 1]; 
end