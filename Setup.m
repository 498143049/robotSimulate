%ÎÄ¼þ¶ÁÈ¡
[v,f,n]=stlread('data/buttom.stl');
patch('Faces',f,'Vertices',v,'FaceColor',[ 0.2078    0.3608    0.6549],'LineStyle','none');
hold on 
[v,f,n]=stlread('data/linkone1.stl');
v=v+repmat([0,0,285],[3*n,1]);
patch('Faces',f,'Vertices',v,'FaceColor',[  0    0.7137    0.7569],'LineStyle','none');

[v,f,n]=stlread('data/linktwo2.stl');
v=v+repmat([0,250,285],[3*n,1]);
patch('Faces',f,'Vertices',v,'FaceColor',[  0.0039    0.7373    0.5608],'LineStyle','none');

[v,f,n]=stlread('data/linkthree3.stl');
v=v+repmat([0,520,325],[3*n,1]);
patch('Faces',f,'Vertices',v,'FaceColor',[   0.6039    0.2588    0.5882],'LineStyle','none');

[v,f,n]=stlread('data/linkfour4.stl');
v=v+repmat([0,520,110],[3*n,1]);
patch('Faces',f,'Vertices',v,'FaceColor',[   0.9020    0.5490    0.8863],'LineStyle','none');

view(99,10);
