

function status = createFit()
n=5
a=xlsread('ab.csv');
y=a(3,1:163);
x=a(5,1:163);
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
disp('parameters')
for i=1:length(value)
    disp(['#define ',name{i,1},' ',num2str(value(i))])
end
 plot(fitresult,x,y)
status='ok';