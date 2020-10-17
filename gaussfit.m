function [a,b,c,d,fitfunction] = gaussfit (xdata, y_actual)
%Takes as input x and y values of data (must be nx1 vectors)
%Returns the paramaters a, b, c, d such that f(x) = a+b*exp(-((x-c)^2/(2*d^2)), d!=0

%Example call: >> [a,b,c,d,ff] = gaussfit(x,y)

%Define custom fit options
%Variables: a = offset, b = peak height; c = peak x-location; d = width
fo = fitoptions('Method','NonlinearLeastSquares',...
    'Lower',[-Inf,-Inf,-Inf,0],... % lower bounds for [a b c d]
    'Upper',[Inf,Inf,Inf,Inf],... % upper bounds for [a b c d]
    'Startpoint',[0 max(y_actual) mean(xdata) max(xdata)-min(xdata)]); % startpoints

%Create fit and get fit parameters
fitfunction = fittype('a+b*exp(-((x-c)^2*(2*d^2)^(-1)))', 'options', fo);
[vars,gof] = fit(xdata, y_actual, fitfunction)
a = vars.a;
b = vars.b;
c = vars.c;
d = vars.d;
end
