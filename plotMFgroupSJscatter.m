AvgMFMax=[2.911 2.014 1.021 7.497 2.251 5.805];
AvgMFBraceMax=[3.369 2.248 1.139 7.883 2.038 5.47];

StdErrMFMax=[0.297 0.198 0.156 0.416 0.226 0.43];
StdErrMFBraceMax=[0.297 0.198 0.156 0.416 0.226 0.43];

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
axis([0 7 0 9])
grid off 
