%% Created by: Katie Ewing
%Modified: July 2015

%This script plots the MEAN plus/minus 1 SEM of the average muscle forces
%by group during combined 30/60 landing. The values taken from GenStat.

%Can make either bar plot or scatter plot.

%%

%Taken from Excel file "MF_stats_table_v2"
% HAMS=[1.453	1.749];
% RECFEM = [1.51	1.731];
% VAS=[5.134	5.729];
% GAS=[1.371	1.438];
% SOL=[4.771	4.628];

AvgMFMax=[1.953 1.453 1.51 5.134 1.371 4.771];
AvgMFBraceMax=[2.251 1.749 1.731 5.729 1.438 4.628];

StdErrMFMax=[0.131 0.142 0.168 0.245 0.088 0.224];
StdErrMFBraceMax=[0.130 0.141 0.167 0.244 0.087 0.223];

% barwitherr([StdErrMFMax' StdErrMFBraceMax'],[AvgMFMax' AvgMFBraceMax'], 'LineWidth',2,...
%     'BarWidth',0.9)  %BAR PLOT
errorbar([0.9, 1.9, 2.9, 3.9, 4.9, 5.9], AvgMFMax, StdErrMFMax, 'o'); %SCATTER
% PLOT
hold on;
errorbar([1.1, 2.1, 3.1, 4.1, 5.1, 6.1],AvgMFBraceMax, StdErrMFBraceMax, 'o', 'MarkerEdgeColor','r')
% set(gca, 'XTickLabel', {'','HAMS', 'RECFEM', 'VAS', 'GAS', 'SOL',''})
set(gca, 'XTickLabel', {'', 'GMAX', 'HAMS', 'RECFEM', 'VAS', 'GAS', 'SOL'})
legend('No Brace', 'Brace')
legend boxoff
ylabel('Peak Muscle Force (B.W.)')
axis([0 7 0 7])
grid off 



% 
% SEMIMEM=[0.475	0.5403];
% SEMITEND=[0.1078	0.1256];
% BIFEM_LH=[0.891	1.112];
% BIFEM_SH=[0.1367	0.1624];
% RECFEM=[1.51	1.731];
% VASMED=[1.269	1.424];
% VASINT=[1.356	1.494];
% VASLAT=[2.529	2.825];

% b=bar([SEMIMEM; SEMITEND;BIFEM_LH;BIFEM_SH;RECFEM;VASMED; VASINT; VASLAT],'BarWidth',1);
% b=bar([HAMS, VAS, GAS, SOL],'BarWidth',1);
% 
% legend('NO BRACE', 'BRACE', 'Location','northwest');
% legend('boxoff');
% ylabel('Muscle Force (B.W.)');
% set(gca, 'XTickLabel', {'SEMIMEM', 'SEMITEND', 'BIFEM_LH','BIFEM_SH','RECFEM','VASMED','VASINT', 'VASLAT'});
% set(b(1),'FaceColor','b');
% set(b(2),'FaceColor','r');


%30cm
% AvgMFMax=[
% AvgMFBraceMax=[0.7895 5.1142 1.252 4.1866];
% 
% StdMFMax=[
% StdMFBraceMax=[0.4964 0.9827 0.3639 0.8670];

%60cm
% AvgMFMax=[2.0389 5.8468 1.4819 5.1662];
% AvgMFBraceMax=[2.2358 6.4407 1.5250 5.0763];
% 
% StdMFMax=[0.9149 1.0363 0.3130 0.9527];
% StdMFBraceMax=[0.6969 1.1133 0.3608 0.8416];
