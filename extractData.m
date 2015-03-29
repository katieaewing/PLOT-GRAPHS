function [tableIK, tableID, tableMF, outGRF, outIK, outMF, outID] = extractData(inputDirTask, inputIKpath, inputGRFpath, inputIDpath, inputMFpath)
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
    
        
end
