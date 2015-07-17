%% Created by: Katie Ewing 
% Modified: June 2015
%
% This function finds the indices for the start and end of the landing
% phase in the GRF and MF files.
%
% Input: whichSubjects = subjects you want to average i.e. [1:15]
%        brace = brace condition i.e. 1 for no brace, 2 for brace

%%

function [iniIndMF, EndIndMF, iniIndGRF, EndIndGRF, OffIndGRF, OffIndMF] = getIndicesLanding(task, indGRF, outGRF, inputMF, IniTime, EndTime, OffTime)    

    iniIndGRF=indGRF(1,1);

    %Find frame of end time in input GRF data
    EndIndGRF=1;
    while abs((outGRF.data(EndIndGRF,1) - EndTime))> 0.0001
        EndIndGRF=EndIndGRF+1;
    end
  
    %Find frame of initial time in MF data
    iniIndMF=1;
    while abs((inputMF.(1)(iniIndMF) - IniTime))> 0.002
         iniIndMF=iniIndMF+1;
    end
   
    %Find frame of end time in MF data
    EndIndMF=1;
    while abs((inputMF.(1)(EndIndMF) - EndTime))> 0.0001
        EndIndMF=EndIndMF+1;
    end
    
    if task == 7
        
        %Find frame of off time in GRF data
        OffIndGRF=indGRF(end);
        
        %Find frame of off time in MF data
        [~,OffIndMF]=min(abs(OffTime-inputMF.(1)));
    
    end
    
        
end

	            
            