

function status = createFit(x, y, n)
xData = x(:);
yData = y(:);
% ����ѡ��
ft = fittype( ['fourier',num2str(n)'] );
opts = fitoptions( ft );
opts.Display = 'Off';
% ��ȡ��Ͳ���
[fitresult, gof] = fit( xData, yData, ft, opts );
name=coeffnames(fitresult);
value=coeffvalues(fitresult);
for i=1:length(value)
    disp(['#define ',name{i,1},' ',num2str(value(i))])
end
 plot(fitresult,x,y)
status='ok';