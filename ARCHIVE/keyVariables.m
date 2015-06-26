% ARCHIVE
% This function will provide the necessary inputs for Justin's Finite Element model

function keyVariables(task, KneeJoint, whichLeg, GRF_Tor, IKfinal, MFfinal_BW, maxGRF_BW, IKfinal_max2, MFfinal_BW_max2)

% FLEX_EXT=abs(IKfinal.(KneeJoint{1}));
% FLEX_EXT_RAD=degtorad(FLEX_EXT);
FLEX_MAX=IKfinal_max2.(KneeJoint{1});

% FLEX_EXT_RAD=degtorad(FLEX_EXT);

switch whichLeg
    case 'right'
        
%          HAMS=MFfinal_BW.semimem_r + MFfinal_BW.semiten_r + MFfinal_BW.bifemlh_r + MFfinal_BW.bifemsh_r;
%         REC_FEM=MFfinal_BW.rect_fem_r;
%         VAS=MFfinal_BW.vas_med_r + MFfinal_BW.vas_int_r + MFfinal_BW.vas_lat_r;
%         GAS=MFfinal_BW.med_gas_r + MFfinal_BW.lat_gas_r;
%         SOL=MFfinal_BW.soleus_r;
        if task == 3 || task == 4 % for NON-DOMINANT LEG
        
        GRF_BW_testleg_MAX=maxGRF_BW(9);
        HAMS_MED_MAX=MFfinal_BW_max2.semimem_l + MFfinal_BW_max2.semiten_l;
        HAMS_LAT_MAX=MFfinal_BW_max2.bifemlh_l + MFfinal_BW_max2.bifemsh_l;
        REC_FEM_MAX=MFfinal_BW_max2.rect_fem_l;
        VAS_MED_MAX=MFfinal_BW_max2.vas_med_l;
        VAS_INT_MAX= MFfinal_BW_max2.vas_int_l;
        VAS_LAT_MAX= MFfinal_BW_max2.vas_lat_l;
        GAS_MED_MAX=MFfinal_BW_max2.med_gas_l;
        GAS_LAT_MAX=MFfinal_BW_max2.lat_gas_l;
        SOL_MAX=MFfinal_BW_max2.soleus_l;

        else
        
        
        %max values
        GRF_BW_testleg_MAX=maxGRF_BW(3);
        HAMS_MED_MAX=MFfinal_BW_max2.semimem_r + MFfinal_BW_max2.semiten_r;
        HAMS_LAT_MAX=MFfinal_BW_max2.bifemlh_r + MFfinal_BW_max2.bifemsh_r;
        REC_FEM_MAX=MFfinal_BW_max2.rect_fem_r;
        VAS_MED_MAX=MFfinal_BW_max2.vas_med_r;
        VAS_INT_MAX= MFfinal_BW_max2.vas_int_r;
        VAS_LAT_MAX= MFfinal_BW_max2.vas_lat_r;
        GAS_MED_MAX=MFfinal_BW_max2.med_gas_r;
        GAS_LAT_MAX=MFfinal_BW_max2.lat_gas_r;
        SOL_MAX=MFfinal_BW_max2.soleus_r;
  
        end
        
                
    case 'left'
        
        if task == 3 || task == 4
                   
        %max values
        GRF_BW_testleg_MAX=maxGRF_BW(3);
        HAMS_MED_MAX=MFfinal_BW_max2.semimem_r + MFfinal_BW_max2.semiten_r;
        HAMS_LAT_MAX=MFfinal_BW_max2.bifemlh_r + MFfinal_BW_max2.bifemsh_r;
        REC_FEM_MAX=MFfinal_BW_max2.rect_fem_r;
        VAS_MED_MAX=MFfinal_BW_max2.vas_med_r;
        VAS_INT_MAX= MFfinal_BW_max2.vas_int_r;
        VAS_LAT_MAX= MFfinal_BW_max2.vas_lat_r;
        GAS_MED_MAX=MFfinal_BW_max2.med_gas_r;
        GAS_LAT_MAX=MFfinal_BW_max2.lat_gas_r;
        SOL_MAX=MFfinal_BW_max2.soleus_r;
        
        
        else
                
        GRF_BW_testleg_MAX=maxGRF_BW(9); 
        HAMS_MED_MAX=MFfinal_BW_max2.semimem_l + MFfinal_BW_max2.semiten_l;
        HAMS_LAT_MAX=MFfinal_BW_max2.bifemlh_l + MFfinal_BW_max2.bifemsh_l;
        REC_FEM_MAX=MFfinal_BW_max2.rect_fem_l;
        VAS_MED_MAX=MFfinal_BW_max2.vas_med_l;
        VAS_INT_MAX= MFfinal_BW_max2.vas_int_l;
        VAS_LAT_MAX= MFfinal_BW_max2.vas_lat_l;
        GAS_MED_MAX=MFfinal_BW_max2.med_gas_l;
        GAS_LAT_MAX=MFfinal_BW_max2.lat_gas_l;
        SOL_MAX=MFfinal_BW_max2.soleus_l;
        
        end
        
end

MaxValues = [GRF_BW_testleg_MAX, FLEX_MAX, HAMS_MED_MAX, HAMS_LAT_MAX, REC_FEM_MAX, VAS_MED_MAX, VAS_INT_MAX, VAS_LAT_MAX, GAS_MED_MAX, GAS_LAT_MAX, SOL_MAX]; 
VarNamesMax = {'GRF_BW_MAX', 'FLEX_MAX', 'HAMS_MED_MAX', 'HAMS_LAT_MAX', 'REC_FEM_MAX', 'VAS_MED_MAX','VAS_INT_MAX', 'VAS_LAT_MAX', 'GAS_MED_MAX', 'GAS_LAT_MAX', 'SOL_MAX'};
MaxKeyVars = array2table(MaxValues, 'VariableNames', VarNamesMax);

writetable(MaxKeyVars, 'MaxKeyVars.xls');

end





