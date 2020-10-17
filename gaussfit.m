function [fitfunction] = gaussfit (xdata, y_actual)
%Takes as input x and y values of data (must be nx1 vectors)
%Returns the actual fit function

%Example call: >> [gfit] = gaussfit(x,y)

fo = fitoptions('Method','NonlinearLeastSquares',...
    'Lower',[-Inf,-Inf,0],... % lower bounds for [a b c]
    'Upper',[Inf,Inf,Inf],... % upper bounds for [a b c]
    'Startpoint',[max(y_actual) mean(xdata) max(xdata)-min(xdata)]); % startpoints

%Create fit 
fitfunction = fittype('a*exp(-((x-b)^2*(2*c^2)^(-1)))', 'options', fo);
end
