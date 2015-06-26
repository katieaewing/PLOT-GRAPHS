%% Created by: Katie Ewing 
% Modified: June 2015
%
% This function will provide the necessary inputs for Justin's Finite
% Element model.
% This includes the knee flexion angle in RADIANS, muscle forces by GROUP,
% and the GRF torque.
%%

function [FE_inputs]=inputsFEmodel(task, KneeJoint, whichLeg, GRF_all, GRF_Tor, IKfinal, MFfinal)

FLEX_EXT=abs(IKfinal.(KneeJoint{1}));
FLEX_EXT_RAD=degtorad(FLEX_EXT);

switch whichLeg
    case 'right'
        
        if task == 3 || task == 4 % for NON-DOMINANT LEG
        
        GRF_FE=GRF_all(:, 9); 
        HAMS_MED=MFfinal.semimem_l + MFfinal.semiten_l;
        HAMS_LAT=MFfinal.bifemlh_l + MFfinal.bifemsh_l;
        REC_FEM=MFfinal.rect_fem_l;
        VAS_MED=MFfinal.vas_med_l;
        VAS_INT= MFfinal.vas_int_l;
        VAS_LAT= MFfinal.vas_lat_l;
        GAS_MED=MFfinal.med_gas_l;
        GAS_LAT=MFfinal.lat_gas_l;
        SOL=MFfinal.soleus_l;
        
        GRF_TORQ=GRF_Tor.ground_torque_y_l;
        
        else
            
        GRF_FE=GRF_all(:, 3);
        HAMS_MED=MFfinal.semimem_r + MFfinal.semiten_r;
        HAMS_LAT=MFfinal.bifemlh_r + MFfinal.bifemsh_r;
        REC_FEM=MFfinal.rect_fem_r;
        VAS_MED=MFfinal.vas_med_r;
        VAS_INT= MFfinal.vas_int_r;
        VAS_LAT= MFfinal.vas_lat_r;
        GAS_MED=MFfinal.med_gas_r;
        GAS_LAT=MFfinal.lat_gas_r;
        SOL=MFfinal.soleus_r;
        
        GRF_TORQ=GRF_Tor.ground_torque_y_r;
        
        end
        
            
                
    case 'left'
        
        if task == 3 || task == 4
        
        GRF_FE=GRF_all(:, 3);
        HAMS_MED=MFfinal.semimem_r + MFfinal.semiten_r;
        HAMS_LAT=MFfinal.bifemlh_r + MFfinal.bifemsh_r;
        REC_FEM=MFfinal.rect_fem_r;
        VAS_MED=MFfinal.vas_med_r;
        VAS_INT= MFfinal.vas_int_r;
        VAS_LAT= MFfinal.vas_lat_r;
        GAS_MED=MFfinal.med_gas_r;
        GAS_LAT=MFfinal.lat_gas_r;
        SOL=MFfinal.soleus_r;
        
        GRF_TORQ=GRF_Tor.ground_torque_y_r;
            
        else
          
        GRF_FE=GRF_all(:, 9); 
        HAMS_MED=MFfinal.semimem_l + MFfinal.semiten_l;
        HAMS_LAT=MFfinal.bifemlh_l + MFfinal.bifemsh_l;
        REC_FEM=MFfinal.rect_fem_l;
        VAS_MED=MFfinal.vas_med_l;
        VAS_INT= MFfinal.vas_int_l;
        VAS_LAT= MFfinal.vas_lat_l;
        GAS_MED=MFfinal.med_gas_l;
        GAS_LAT=MFfinal.lat_gas_l;
        SOL=MFfinal.soleus_l;
        
        GRF_TORQ=GRF_Tor.ground_torque_y_l;
        end
        
        
end

GRF_FE=table2array(GRF_FE);
All=[GRF_FE, FLEX_EXT, FLEX_EXT_RAD, HAMS_MED, HAMS_LAT, REC_FEM, VAS_MED, VAS_INT, VAS_LAT, GAS_MED, GAS_LAT, SOL, GRF_TORQ];
VarNames={'GRF_FE', 'FLEX_EXT', 'FLEX_EXT_RAD', 'HAMS_MED', 'HAMS_LAT', 'REC_FEM', 'VAS_MED','VAS_INT', 'VAS_LAT', 'GAS_MED', 'GAS_LAT', 'SOL', 'GRF_TORQ'};
FE_inputs=array2table(All, 'VariableNames', VarNames);

writetable(FE_inputs,'FE_Model_Inputs.xls');

end




