%% Created by: Katie Ewing
% Modified: June 2015
% 
% This function groups muscle forces by group i.e. medial and lateral
% hamstrings, quadriceps, etc. It also finds the maximum grouped values and
% the time (percent landing phase) when they occur.
%%
function [MF_BW_groups, maxMF_BW_groups] = MFbyGroup(task, stance, whichLeg, MFfinal_BW)

switch whichLeg
    case 'right'
        
        if task == 3 || task == 4 % for NON-DOMINANT LEG
        
        HAMS_MED=MFfinal_BW.semimem_l + MFfinal_BW.semiten_l;
        HAMS_LAT=MFfinal_BW.bifemlh_l + MFfinal_BW.bifemsh_l;
        HAMS=MFfinal_BW.semimem_l + MFfinal_BW.semiten_l + MFfinal_BW.bifemlh_l + MFfinal_BW.bifemsh_l;
        
        REC_FEM=MFfinal_BW.rect_fem_l;
        VAS_MED=MFfinal_BW.vas_med_l;
        VAS_INT= MFfinal_BW.vas_int_l;
        VAS_LAT= MFfinal_BW.vas_lat_l;
        QUADS=MFfinal_BW.rect_fem_l + MFfinal_BW.vas_med_l + MFfinal_BW.vas_int_l + MFfinal_BW.vas_lat_l; 
        
        GAS_MED=MFfinal_BW.med_gas_l;
        GAS_LAT=MFfinal_BW.lat_gas_l;
        GAS=MFfinal_BW.med_gas_l + MFfinal_BW.lat_gas_l;
        SOL=MFfinal_BW.soleus_l;
        
        
        else
            
        HAMS_MED=MFfinal_BW.semimem_r + MFfinal_BW.semiten_r;
        HAMS_LAT=MFfinal_BW.bifemlh_r + MFfinal_BW.bifemsh_r;
        HAMS=MFfinal_BW.semimem_r + MFfinal_BW.semiten_r + MFfinal_BW.bifemlh_r + MFfinal_BW.bifemsh_r;
        
        REC_FEM=MFfinal_BW.rect_fem_r;
        VAS_MED=MFfinal_BW.vas_med_r;
        VAS_INT= MFfinal_BW.vas_int_r;
        VAS_LAT= MFfinal_BW.vas_lat_r;
        QUADS=MFfinal_BW.rect_fem_r + MFfinal_BW.vas_med_r + MFfinal_BW.vas_int_r + MFfinal_BW.vas_lat_r; 
        
        GAS_MED=MFfinal_BW.med_gas_r;
        GAS_LAT=MFfinal_BW.lat_gas_r;
        GAS=MFfinal_BW.med_gas_r + MFfinal_BW.lat_gas_r;
        SOL=MFfinal_BW.soleus_r;
                
        end
        
            
                
    case 'left'
        
        if task == 3 || task == 4
        
        HAMS_MED=MFfinal_BW.semimem_r + MFfinal_BW.semiten_r;
        HAMS_LAT=MFfinal_BW.bifemlh_r + MFfinal_BW.bifemsh_r;
        HAMS=MFfinal_BW.semimem_r + MFfinal_BW.semiten_r + MFfinal_BW.bifemlh_r + MFfinal_BW.bifemsh_r;

        REC_FEM=MFfinal_BW.rect_fem_r;
        VAS_MED=MFfinal_BW.vas_med_r;
        VAS_INT= MFfinal_BW.vas_int_r;
        VAS_LAT= MFfinal_BW.vas_lat_r;
        QUADS=MFfinal_BW.rect_fem_r + MFfinal_BW.vas_med_r + MFfinal_BW.vas_int_r + MFfinal_BW.vas_lat_r; 

        GAS_MED=MFfinal_BW.med_gas_r;
        GAS_LAT=MFfinal_BW.lat_gas_r;
        GAS=MFfinal_BW.med_gas_r + MFfinal_BW.lat_gas_r;
        SOL=MFfinal_BW.soleus_r;
                    
        else
          
        HAMS_MED=MFfinal_BW.semimem_l + MFfinal_BW.semiten_l;
        HAMS_LAT=MFfinal_BW.bifemlh_l + MFfinal_BW.bifemsh_l;
        HAMS=MFfinal_BW.semimem_l + MFfinal_BW.semiten_l + MFfinal_BW.bifemlh_l + MFfinal_BW.bifemsh_l;

        REC_FEM=MFfinal_BW.rect_fem_l;
        VAS_MED=MFfinal_BW.vas_med_l;
        VAS_INT= MFfinal_BW.vas_int_l;
        VAS_LAT= MFfinal_BW.vas_lat_l;
        QUADS=MFfinal_BW.rect_fem_r + MFfinal_BW.vas_med_r + MFfinal_BW.vas_int_r + MFfinal_BW.vas_lat_r; 

        GAS_MED=MFfinal_BW.med_gas_l;
        GAS_LAT=MFfinal_BW.lat_gas_l;
        GAS=MFfinal_BW.med_gas_r + MFfinal_BW.lat_gas_r;
        SOL=MFfinal_BW.soleus_l;
        
        end
        
        
end

All=[HAMS_MED, HAMS_LAT, HAMS, REC_FEM, VAS_MED, VAS_INT, VAS_LAT, QUADS, GAS_MED, GAS_LAT, GAS, SOL];
VarNames2={'HAMS_MED', 'HAMS_LAT' , 'HAMS', 'REC_FEM', 'VAS_MED', 'VAS_INT', 'VAS_LAT', 'QUADS', 'GAS_MED', 'GAS_LAT', 'GAS', 'SOL'};
MF_BW_groups=array2table(All, 'VariableNames', VarNames2);

writetable(MF_BW_groups,'MF_BW_groups.xls');
MF_BW_groups_matrix=table2array(MF_BW_groups);
MF_BW_groups_MAX = max(abs(MF_BW_groups_matrix));
MF_BW_groups_MAX2 = array2table(MF_BW_groups_MAX, 'VariableNames',VarNames2);

% Timing of peak muscle forces (in terms of percent landing phase)
for aa=1:size(MF_BW_groups, 2)
    indStance= 1;
    while abs(MF_BW_groups_MAX(aa)-abs(MF_BW_groups_matrix(indStance,aa))) > 0.000000015
        indStance=indStance+1;
    end
    indAllMF(aa)=indStance;
    
end
stancePercentMF=stance(indAllMF);
stancePercentMF2=array2table(stancePercentMF, 'VariableNames', VarNames2);

maxMF_BW_groups=[MF_BW_groups_MAX2; stancePercentMF2];
writetable(maxMF_BW_groups, 'maxMF_BW_groups_mag_time.xls');

end

