function plotGraphs(stance, GRFfinal, IKfinal, IDfinal, MFfinal)

task_label = {'SL30'; 'SL60'; 'SLND30'; 'SLND60'; 'DL30'; 'DL60'; 'SJ'};
cd(DirTask);
cd ..
mkdir('NEW GRAPHS',[task_label{task}]);
newDir=pwd
cd([newDir,'\NEW GRAPHS\' task_label{task}]);



figure(1);
set(gcf,'DefaultAxesColorOrder',[0 0 1; 0 0.5 0; 1 0 0; 0 0.75 0.75; 0.75 0 0.75; 0.75 0.75 0; 0.25 0.25 0.25; 1 0.6 0.6]);
hold on;
plot(stance,GRF_average, 'LineWidth', 1.5, 'Color', [0.25 0.25 0.25],'LineStyle','--');
plot(stance,MF_average, 'LineWidth', 1.5);


figure(2);
