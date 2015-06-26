
SEMIMEM=[0.475	0.5403];
SEMITEND=[0.1078	0.1256];
BIFEM_LH=[0.891	1.112];
BIFEM_SH=[0.1367	0.1624];
RECFEM=[1.51	1.731];
VASMED=[1.269	1.424];
VASINT=[1.356	1.494];
VASLAT=[2.529	2.825];

b=bar([SEMIMEM; SEMITEND;BIFEM_LH;BIFEM_SH;RECFEM;VASMED; VASINT; VASLAT],'BarWidth',1);

legend('NO BRACE', 'BRACE', 'Location','northwest');
legend('boxoff');
ylabel('Muscle Force (B.W.)');
set(gca, 'XTickLabel', {'SEMIMEM', 'SEMITEND', 'BIFEM_LH','BIFEM_SH','RECFEM','VASMED','VASINT', 'VASLAT'});
set(b(1),'FaceColor','b');
set(b(2),'FaceColor','r');