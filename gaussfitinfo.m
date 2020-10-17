function [gof] = gaussfitinfo(gfit, xdata, y_actual)
%Takes in a Gauss fit from gaussfit function
%Returns the goodness-of-fit, SSE, and r^2
%Then plots the fit curve against the data

%Example call: >> [gof] = gaussfitinfo(gfit,x,y) (where gfit is the
%   Gaussian fit returned by gaussfit function)

[vars,gof] = fit(xdata, y_actual, gfit)
a = vars.a;
b = vars.b;
c = vars.c;
%d (width) cannot be 0 or else Gauss fit would not be a continuous function
if (vars.d ~= 0) d = vars.d;
    else 'fit not possible!'
    end

%Plot the curve that the function created and the actual y-values
x = [min(xdata):.1:max(xdata)];
y = a+b*exp(-((x-c).^2/(2*d^2)));
plot(xdata,y_actual,'bo');
hold on;
plot(x,y,'k-');

%Plot the predicted y-values located on the curve for comparison
y_pred = a+b*exp(-((xdata-c).^2/(2*d^2)));
plot(xdata,y_pred,'ro');
legend('y actual', 'gaussian curve', 'y predicted');

%Calculations for SSE and r^2 of fit function
mn = mean(y_actual);
meanvar = y_actual - mn;
s_mn = sum(meanvar.^2);

linearresiduals = y_actual - y_pred;
sse_gauss = sum(linearresiduals.^2)

r2_gauss = 1-sse_gauss/s_mn