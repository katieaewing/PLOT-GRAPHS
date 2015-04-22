function plotThisTrial

load('AllVariables.mat')

VarsGRF=GRFfinal_BW.Properties.VariableNames;
GRFfinal=table2array(GRFfinal_BW);

for i=1:size(GRFfinal,2)
   
   figure(1);
   set(gcf, 'units','normalized','outerposition',[0 0 1 1]);
   subplot(3,5,i);
   plot(stance,GRFfinal(:,i));
   xlabel('Percent Landing Phase');
   ylabel('GRF (B.W.)');
   title(VarsGRF(i));
   savefig('GRF.fig');
   
end



VarsIK=IKfinal.Properties.VariableNames;
IKfinal=table2array(IKfinal);
for i=1:size(IKfinal,2)
   
   figure(2);
   set(gcf, 'units','normalized','outerposition',[0 0 1 1]);
   subplot(4,6,i);
   plot(stance,IKfinal(:,i));
   xlabel('Percent Landing Phase');
   ylabel('Angle (deg)');
   title(VarsIK(i));
   savefig('IK.fig');
end

VarsID=IDfinal_BW.Properties.VariableNames;
IDfinal=table2array(IDfinal_BW);

for i=1:size(IDfinal,2)
   
   figure(3);
   set(gcf, 'units','normalized','outerposition',[0 0 1 1]);
   subplot(4,6,i);
   plot(stance,IDfinal(:,i));
   xlabel('Percent Landing Phase');
   ylabel('Moment (Nm/kg)');
   title(VarsID(i));
   savefig('ID.fig');
   
end


VarsMF=MFfinal_BW.Properties.VariableNames;
MFfinal=table2array(MFfinal_BW);

for i=1:44
   
   figure(4);
   set(gcf, 'units','normalized','outerposition',[0 0 1 1]);
   subplot(4,11,i);
   plot(stance,MFfinal(:,i));
   xlabel('Percent Landing Phase');
   ylabel('MF (B.W.)');
   title(VarsMF(i));
   savefig('MF.fig');
   
end
end


