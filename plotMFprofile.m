
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


%30cm
% AvgMFMax=[
% AvgMFBraceMax=[0.7895 5.1142 1.252 4.1866];
% 
% StdMFMax=[
% StdMFBraceMax=[0.4964 0.9827 0.3639 0.8670];

%60cm
AvgMFMax=[2.0389 5.8468 1.4819 5.1662];
AvgMFBraceMax=[2.2358 6.4407 1.5250 5.0763];

StdMFMax=[0.9149 1.0363 0.3130 0.9527];
StdMFBraceMax=[0.6969 1.1133 0.3608 0.8416];

%no brace 60 cm had 14 subjects, brace 60cm had 15 subjects
barwitherr([(StdMFMax./sqrt(14))' (StdMFBraceMax./sqrt(15))'],[AvgMFMax' AvgMFBraceMax'], 'LineWidth',2,...
    'BarWidth',0.7)
set(gca, 'XTickLabel', {'HAMSTRINGS', 'QUADRICEPS', 'GASTROCNEMIUS', 'SOLEUS'})
legend('No Brace', 'Brace')
legend boxoff
ylabel('Peak Muscle Force (B.W.)')
   
