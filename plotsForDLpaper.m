%% Created by: Katie Ewing 
% Modified: June 2015

%% Plots side-by-side bar plots of brace/gender interaction variables 

subplot(1,2,1)
Male=[13.50 14.230];
Female=[15.520 19.100];
% MaleStd=
b=bar([Male;Female],'BarWidth',1);
% legend('NO BRACE', 'BRACE', 'Location','northwest');
% legend('boxoff');
ylabel('Hip Flexion Angle at Initial Contact (deg)');
set(gca, 'XTickLabel', {'MALE', 'FEMALE'});
set(b(1),'FaceColor','w');
set(b(2),'FaceColor','k');

subplot(1,2,2)
Male=[29.090 28.620];
Female=[38.650 34.610];
b=bar([Male;Female],'BarWidth',1);
legend('NO BRACE', 'BRACE', 'Location','northwest');
legend('boxoff');
ylabel('Peak Angle Dorsiflexion Angle (deg)');
set(gca, 'XTickLabel', {'MALE', 'FEMALE'});
set(b(1),'FaceColor','w');
set(b(2),'FaceColor','k');

errorbarxy(Male, [1 2]);

% standard errors
% 	0	1.303	1.303
% 	1	1.259	1.219

%% Pie chart of joint contributions to total work

x=[.1995, .3237, .4769];
labels={'20%','32%','48%'};
x1=subplot(1,2,1,'Position',[0.15 0.3 0.4 0.4])
% xp=findobj(x1, 'Type','patch');
xp=pie(x,labels);
% set(xp, 'LineWidth',2);
% set(xp, 'EdgeColor','none');
title(x1, 'NO BRACE','FontWeight','bold','FontSize',12);
set(xp(1),'FaceColor',['w']);
set(xp(3),'FaceColor',[0.4 0.4 0.4]);
set(xp(5),'FaceColor',['k']);
set(xp(6),'Color',['w']);

hText = findobj(xp,'Type','text');
textPositions_cell = get(hText,{'Position'}); % cell array
textPositions = cell2mat(textPositions_cell); % numeric array
textPositions = textPositions * 0.4; % scale position
set(hText,{'Position'},num2cell(textPositions,[3,2])) % set new position


y=[.2570, .3309, .4121];
labels={'26%','33%','41%'};
y1=subplot(1,2,2,'Position',[0.45 0.3 0.4 0.4]);
yp=pie(y,labels);
title(y1, 'BRACE','FontWeight','bold','FontSize',12);

set(yp(1),'FaceColor',['w']);
set(yp(3),'FaceColor',[0.4 0.4 0.4]);
set(yp(5),'FaceColor',['k']);
set(yp(6),'Color',['w']);

hText = findobj(yp,'Type','text');
textPositions_cell = get(hText,{'Position'}); % cell array
textPositions = cell2mat(textPositions_cell); % numeric array
textPositions = textPositions * 0.4; % scale position
set(hText,{'Position'},num2cell(textPositions,[3,2])) % set new position

set(findall(gcf,'type','text'),'FontName','Times');

%%


