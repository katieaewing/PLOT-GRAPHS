function [FlexAtPeakGRF, FlexAtIC] = getFlexionAngles(GRFfinal_BW, IKfinal, outIK, GRFleg)

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

FlexTable=table2array(IKfinal); %DON'T TAKE ABSOLUTE VALUE. MESSES UP ANKLE FLEXION
FlexAtPeakGRF=FlexTable(indPeakGRF,:);
FlexAtPeakGRF=array2table(FlexAtPeakGRF, 'VariableNames', outIK.labels);
writetable(FlexAtPeakGRF, 'FlexAtPeakGRF.xls');


%Finding ALL flexion angles at initial contact
FlexAtIC=FlexTable(1,:);
FlexAtIC=array2table(FlexAtIC, 'VariableNames', outIK.labels);

writetable(FlexAtIC, 'FlexAtIC.xls');

end




