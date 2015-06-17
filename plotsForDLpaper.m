
Male=[13.50 14.230];
Female=[15.520 19.100];
b=bar([Male;Female],'BarWidth',1);
legend('NO BRACE', 'BRACE', 'Location','northwest');
legend('boxoff');
ylabel('Hip Flexion Angle at Initial Contact (deg)');
set(gca, 'XTickLabel', {'MALE', 'FEMALE'});
set(b(1),'FaceColor','w');
set(b(2),'FaceColor','k');


Male=[29.090 28.620];
Female=[38.650 34.610];
b=bar([Male;Female],'BarWidth',1);
legend('NO BRACE', 'BRACE', 'Location','northwest');
legend('boxoff');
ylabel('Peak Angle Dorsiflexion Angle (deg)');
set(gca, 'XTickLabel', {'MALE', 'FEMALE'});
set(b(1),'FaceColor','w');
set(b(2),'FaceColor','k');