function[a,b,c,d]=fit_arm_nerve(data)
% FIT_ARM_NERVE Fit Gaussian to arm nerve data
%
% [A,B,C,D]=FIT_ARM_NERVE(data)
%
% Input: arm nerve data
%   Examines if the responses across locations are
%     significantly different via ANOVA analysis.
%     If so, then a gaussian fit is performed and
%     A(offset) B (magnitude) C (peak location) and D
%     (tuning width parameter) are returned. If the ANOVA
%     is not significant with alpha 0.05, then A,B,C,and D
%     are set to NaN.
% Output: [a,b,c,d]
%
locations = data(1,:); % first row, assigns x values
rawdata = data(2:end,:); % row 2 through N, assigns y values

Num_reps = size(rawdata,1); % number of rows in rawdata

G = repmat(1:length(locations),Num_reps,1); %generate groups according to location
rawdatacolumn=rawdata(:); %rewrite raw data as a column
Gcolumn=G(:); %rewrite group (location) as a column

[anova_p]=anova1(rawdatacolumn,Gcolumn,'off'); % compute the anova p-value

if anova_p<0.05
    xloc=repmat(locations,Num_reps,1);
    xcolumn=xloc(:);
    [a,b,c,d]=gaussfit(xcolumn,rawdatacolumn); 
else
    a=NaN;
    b=NaN;
    c=NaN;
    d=NaN;
end

