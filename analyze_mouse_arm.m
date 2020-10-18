function  [a,b,c,d] = analyze_mouse_arm(folder)
% ANALYZE_MOUSE - Analyze folder of data
% [change,rate,a,b,c,d] = ANALYZE_MOUSE(FOLDERNAME)
%
% Steps through all subdirectories of the folder
% FOLDERNAME and looks for files called
% 'mouse_arm_data.txt'
%
% If it finds one, then it performs a fit
% using GAUSSFIT.m. The A, B, C, D
% of that function are returned.
%
subdirs = dir(folder);
a = []; b = []; c = []; d = [];
for i=1:length(subdirs),
    if subdirs(i).isdir&~strcmp(subdirs(i).name,'.')&~strcmp(subdirs(i).name,'..'),
        filename = [folder filesep subdirs(i).name filesep 'mouse_arm_data.txt'];
        if exist(filename),
            disp(['Analyzing file ' filename '.']);
            data = load(filename,'-ascii');
            [a_,b_,c_,d_] = fit_arm_nerve(data); %calls up fit_arm_nerve that has already used gaussfit
            a(end+1) = a_;
            b(end+1) = b_;
            c(end+1) = c_;
            d(end+1) = d_;
        end;
    end;
end

