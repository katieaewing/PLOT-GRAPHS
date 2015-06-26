%ARCHIVE

function getMaxValuesPerSubj(subjectID, brace, outGRF, outIK, outMF, outID)
%this may not be necessary!!!!!!!!!!!!

task_label = {'SL30'; 'SL60'; 'SLND30'; 'SLND60'; 'DL30'; 'DL60'; 'SJ'};
stance=linspace(0,100,200);

for task=[5 6]
%     1:length(task_label) %average subjects one task at a time

%        AllSubjects=[]; %create empty array
           
           Dir=['C:\MyOpenSim4','\Subject_',int2str(subjectID)]; %change to subject directory

            switch brace %switch case depending on brace condition

                case 1
                    DirAvg=[Dir,'\NO BRACE\AVERAGES']; %This folder is already created
                    condStr='_';
                    DirSubAvg='C:\MyOpenSim4\SUBJECT_AVERAGES';                

                case 2
                    DirAvg=[Dir,'\BRACE\AVERAGES']; %This folder is already created
                    condStr='_Brace_';
                    DirSubAvg='C:\MyOpenSim4\SUBJECT_AVERAGES_BRACE'; 

            end

        cd(DirAvg);  

        %create file names of averaged trials (correspond to tables created
        %from averageTrials).
        
        SubAvgFEFile=([task_label{task} condStr 'FE.xls']);
        SubAvgIKFile=([task_label{task} condStr 'IK.xls']);
        SubAvgID_BWFile=([task_label{task} condStr 'ID_BW.xls']);
        SubAvgGRF_BWFile=([task_label{task} condStr 'GRF_BW.xls']);
        SubAvgMF_BWFile=([task_label{task} condStr 'MF_BW.xls']);
         
        %need to check if this task exists for this subject
        if exist(SubAvgFEFile)==2 %file does exist. FE can be generalized to all files.            
               
                               
                SubAvgGRF_BW=table2array(readtable(SubAvgGRF_BWFile));
                maxGRF_subAvg1=max(SubAvgGRF_BW);
                varGRF=[outGRF.labels(1:7) 'l_ground_force_vx' 'l_ground_force_vy'	'l_ground_force_vz'	'l_ground_force_px'	'l_ground_force_py'	'l_ground_force_pz'];
                maxGRF_subAvg=array2table(maxGRF_subAvg1,'VariableNames',varGRF);

                % Timing of max GRF (in terms of percent landing phase)
                for bb=1:size(SubAvgGRF_BW, 2)
                indStanceGRF= 1;
                    while abs(maxGRF_subAvg1(bb)-SubAvgGRF_BW(indStanceGRF,bb)) > 0.0015
                        indStanceGRF=indStanceGRF+1;
                    end
                    indAllGRF(bb)=indStanceGRF;
                end

                stancePercentGRF=stance(indAllGRF);
                stancePercentGRF=array2table(stancePercentGRF, 'VariableNames',varGRF);
                maxGRF_mag_time=[maxGRF_subAvg; stancePercentGRF];
                               
                
                % Magnitude of peak joint angles
                SubAvgIK=table2array(readtable(SubAvgIKFile));
                maxIK_subAvg1=max(abs(SubAvgIK));
                maxIK_subAvg=array2table(maxIK_subAvg1,'VariableNames',outIK.labels);

                % Timing of peak joint angles (in terms of percent landing phase)
                for aa=1:size(SubAvgIK, 2)
                    indStanceIK= 1;
                    while abs(maxIK_subAvg1(aa)-abs(SubAvgIK(indStanceIK,aa))) > 0.0015
                        indStanceIK=indStanceIK+1;
                    end
                    indAllIK(aa)=indStanceIK;
    
                end
                stancePercentIK=stance(indAllIK);
                stancePercentIK2=array2table(stancePercentIK, 'VariableNames', outIK.labels);
                maxIK_mag_time=[maxIK_subAvg; stancePercentIK2];
                

                % Magnitude of peak joint moments
                SubAvgID_BW=table2array(readtable(SubAvgID_BWFile));
                maxID_subAvg1=max(abs(SubAvgID_BW));  %NEED TO CHECK SIGN CONVENTIONS
                maxID_subAvg=array2table(maxID_subAvg1,'VariableNames',outID.labels);

                % Timing of peak joint angles (in terms of percent landing phase)
                for aa=1:size(SubAvgID_BW, 2)
                    indStanceID= 1;
                    while abs(maxID_subAvg1(aa)-abs(SubAvgID_BW(indStanceID,aa))) > 0.0015
                        indStanceID=indStanceID+1;
                    end
                    indAllID(aa)=indStanceID;

                end
                stancePercentID=stance(indAllID);
                stancePercentID2=array2table(stancePercentID, 'VariableNames', outID.labels);

                maxID_BW_mag_time=[maxID_subAvg; stancePercentID2];
                
                
                % Magnitude of peak muscle forces
                SubAvgMF_BW=table2array(readtable(SubAvgMF_BWFile));
                maxMF_subAvg1=max(abs(SubAvgMF_BW));
                maxMF_subAvg=array2table(maxMF_subAvg1,'VariableNames',outMF.labels);

                % Timing of peak muscle forces (in terms of percent landing phase)
                for aa=1:size(SubAvgMF_BW, 2)
                    indStance= 1;
                    while abs(maxMF_subAvg1(aa)-abs(SubAvgMF_BW(indStance,aa))) > 0.000000015
                        indStance=indStance+1;
                    end
                    indAllMF(aa)=indStance;

                end
                stancePercentMF=stance(indAllMF);
                stancePercentMF2=array2table(stancePercentMF, 'VariableNames', outMF.labels);

                maxMF_BW_mag_time=[maxMF_subAvg; stancePercentMF2];
                
                                
                cd ../AVG_MAXIMUMS
                writetable(maxGRF_mag_time, 'maxGRF_BW_mag_time_subAvg.xls');
                writetable(maxIK_mag_time, 'maxIK_mag_time_subAvg.xls');
                writetable(maxID_BW_mag_time, 'maxID_BW_mag_time_subAvg.xls');
                writetable(maxMF_BW_mag_time, 'maxMF_BW_mag_time_subAvg.xls');
         
        end
        
       
end
end





