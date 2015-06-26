%% Created by: Katie Ewing 
% Modified: June 2015
%
% This function extracts all output data from OpenSim.
%
% Input: Directory of the given task
%		 Names of file paths

%%


function [tableIK, tableID, tableMF, tableMA, outGRF, outIK, outMF, outID, outMA] = extractData(inputDirTask, inputIKpath, inputGRFpath, inputIDpath, inputMFpath, inputMApath)
% function [tableIK, tableID, tableMF, outGRF, outIK, outMF, outID, outEMG] = extractData(inputDirTask, inputIKpath, inputEMGpath, inputGRFpath, inputIDpath, inputMFpath)
      
    cd(inputDirTask);
       %Extract data from .mot or .sto files and put into tables
        [outIK]= extractMotFile('FILE',inputIKpath,'plot',-1);
        tableIK =array2table(outIK.data, 'VariableNames', outIK.labels);
        
        [outGRF]= extractMotFile('FILE',inputGRFpath,'plot',-1);
%         tableGRF=array2table(outGRF.data, 'VariableNames',outGRF.labels);

%         if exist(inputEMGpath, 'file') ==2
%         [outEMG]=extractMotFile('FILE',inputEMGpath,'plot',-1);
%         end
                      
        DirSO=[inputDirTask '\SO_Results_6Hz_x2_FoM'];
        cd(DirSO);
        [outMF]= extractMotFile('FILE',inputMFpath,'plot',-1);
        tableMF=array2table(outMF.data, 'VariableNames', outMF.labels);
        
        DirID=[inputDirTask '\ID_Results_6Hz'];
        cd(DirID);
        [outID]= extractMotFile('FILE',inputIDpath,'plot',-1);
        tableID=array2table(outID.data, 'VariableNames', outID.labels);
        
        DirMA=[inputDirTask '\MuscleAnalysisResults'];
        cd(DirMA);
        [outMA]=extractMotFile('FILE',inputMApath,'plot',-1);
        tableMA=array2table(outMA.data, 'VariableNames', outMA.labels);
    
%         DirKinem=[inputDirTask '\KinematicsResults'];
%         cd(DirKinem);
%         [outAngVel]=extractMotFile('FILE',inputAngVelpath,'plot',-1);
%         tableAngVel=array2table(outAngVel.data, 'VariableNames', outAngVel.labels);
end
