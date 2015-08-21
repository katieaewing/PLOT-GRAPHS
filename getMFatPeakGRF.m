%% Created by: Katie Ewing 
% Modified: August 2015
% 
% This function retrieves the flexion angles at peak GRF and at initial
% contact and saves them to xls tables.
%%

function [MFAtPeakGRF, MFAtIC] = getMFatPeakGRF(GRFfinal_BW, MFfinal, outMF, GRFleg)

% Magnitude of max GRF
GRFfinal_matrix=table2array(GRFfinal_BW);
maxGRF_BW=max(abs(GRFfinal_matrix)); 

% Timing of max GRF (in terms of percent landing phase)
for bb=1:size(GRFfinal_matrix, 2)
indStanceGRF= 1;
    while abs(maxGRF_BW(bb)-abs(GRFfinal_matrix(indStanceGRF,bb))) > 0.0015
        indStanceGRF=indStanceGRF+1;
    end
    indAllGRF(bb)=indStanceGRF;
end

indPeakGRF=indAllGRF(GRFleg);

%Finding ALL flexion angles at peak GRF

MFTable=table2array(MFfinal); %DON'T TAKE ABSOLUTE VALUE. MESSES UP ANKLE FLEXION
MFAtPeakGRF=MFTable(indPeakGRF,:);
MFAtPeakGRF=array2table(MFAtPeakGRF, 'VariableNames', outMF.labels);
writetable(MFAtPeakGRF, 'MFAtPeakGRF.xls');


%Finding ALL flexion angles at initial contact
MFAtIC=MFTable(1,:);
MFAtIC=array2table(FlexAtIC, 'VariableNames', outMF.labels);

writetable(MFAtIC, 'MFAtIC.xls');

end




