function [iniIndMF, EndIndMF, iniIndGRF, EndIndGRF] = getIndicesLanding(inputindGRF, outGRF, inputMF, IniTime, EndTime)    

    iniIndGRF=inputindGRF(1,1);

    %(Finding frame of end time in inputGRF data)
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
    
end

	            
            