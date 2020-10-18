localdirectory='C:\Users\munch\Documents\MATLAB\BIOL107A\TP1';
directory_name = [localdirectory filesep 'mouse_data-2'];
knockout_dir = [directory_name filesep 'knockout'];
wildtype_dir = [directory_name filesep 'wildtype'];
[a_ko,b_ko,c_ko,d_ko] = analyze_mouse_arm(knockout_dir);
[a_wt,b_wt,c_wt,d_wt] = analyze_mouse_arm(wildtype_dir);
%looking at each parameter and identifying/weeding out the NaNs

aNaN_ko = length(find(isnan(a_ko)));
aNaN_wt = length(find(isnan(a_wt)));
a_ko_good = a_ko(find(~isnan(a_ko)));
a_wt_good = a_wt(find(~isnan(a_wt)));
meana_ko_good = mean(a_ko_good)
meana_wt_good = mean(a_wt_good)

bNaN_ko = length(find(isnan(b_ko)));
bNaN_wt = length(find(isnan(b_wt)));
b_ko_good = b_ko(find(~isnan(b_ko)));
b_wt_good = b_wt(find(~isnan(b_wt)));
meanb_ko_good = mean(b_ko_good)
meanb_wt_good = mean(b_wt_good)

cNaN_ko = length(find(isnan(c_ko)));
cNaN_wt = length(find(isnan(c_wt)));
c_ko_good = c_ko(find(~isnan(c_ko)));
c_wt_good = c_wt(find(~isnan(c_wt)));
meanc_ko_good = mean(c_ko_good)
meanc_wt_good = mean(c_wt_good)

dNaN_ko = length(find(isnan(d_ko)));
dNaN_wt = length(find(isnan(d_wt)));
d_ko_good = d_ko(find(~isnan(d_ko)));
d_wt_good = d_wt(find(~isnan(d_wt)));
meand_ko_good = mean(d_ko_good)
meand_wt_good = mean(d_wt_good)
