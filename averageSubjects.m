%% Created by: Katie Ewing 
% Modified: June 2015
%
% This function averages all data (i.e. average of trials) across a range
% of Subjects. Data must be in the folders created from the function
% averageTrials.
%
% Input: whichSubjects = subjects you want to average i.e. [1:10]
%        brace = brace condition i.e. 1 for no brace, 2 for brace
%e.g. averageSubjects([1:15],1)

%%
function averageSubjects(whichSubjects, brace)

task_label = {'SL30'; 'SL60'; 'SLND30'; 'SLND60'; 'DL30'; 'DL60'; 'SJ'};
leg = {'right'; 'right'; 'right' ; 'right'; 'right'; 'left' ; 'right'  ; 'right' ; 'left' ; 'right' ; 'right'  ; 'right' ; 'right' ; 'right' ; 'right'};

for task= [5:6]  %CHANGE!
%     1:length(task_label) %average subjects one task at a time

       AllSubjects=[]; %create empty array
       i=1;
       while i <=length(whichSubjects) 
           whichLeg = char(leg(whichSubjects(i)));
           Dir=['C:\MyOpenSim4','\Subject_',int2str(whichSubjects(i))]; %change to subject directory

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
        SubAvgMFGroupFile=([task_label{task} condStr 'MFGroup.xls']);
        SubAvgFlexFile=([task_label{task} condStr 'FLEX.xls']);
        SubAvgPowerFile=([task_label{task} condStr 'Power.xls']);
        SubAvgWorkFile=([task_label{task} condStr 'Work.xls']);
        SubAvgAngVelFile=([task_label{task} condStr 'AngVel.xls']);
        SubAvgAngImpFile=([task_label{task} condStr 'AngImp.xls']);
        SubAvgMuscleTorqueFile=([task_label{task} condStr 'MuscleTorque.xls']);
        SubAvgMuscleTorqueHipFile=([task_label{task} condStr 'MuscleTorqueHip.xls']);
        SubAvgMuscleTorqueAnkleFile=([task_label{task} condStr 'MuscleTorqueAnkle.xls']);
        SubAvgRMSTorquesFile=([task_label{task} condStr 'AllRMSTorques.xls']);
        SubAvgMuscleTorqueGroupKneeFile=([task_label{task} condStr 'MuscleTorqueGroupKnee.xls']);
        SubAvgMuscleTorqueGroupHipFile=([task_label{task} condStr 'MuscleTorqueGroupHip.xls']);
        SubAvgMuscleTorqueGroupAnkleFile=([task_label{task} condStr 'MuscleTorqueGroupAnkle.xls']);
        
        
        % and for maximum value tables
        SubAvgMaxGRFFile=([task_label{task} condStr 'MaxGRF.xls']);
        SubAvgMaxIDFile=([task_label{task} condStr 'MaxID.xls']);
        SubAvgMaxIKFile=([task_label{task} condStr 'MaxIK.xls']);
        SubAvgMaxMFFile=([task_label{task} condStr 'MaxMF.xls']);
        SubAvgMaxMFGroupFile=([task_label{task} condStr 'MaxMFGroup.xls']);
        SubAvgMaxPowerFile=([task_label{task} condStr 'MaxPower.xls']);
        SubAvgMaxAngVelFile=([task_label{task} condStr 'MaxAngVel.xls']);
        SubAvgMaxMuscleTorqueGroupKneeFile=([task_label{task} condStr 'MaxMuscleTorqueGroupKnee.xls']);
        SubAvgMaxMuscleTorqueGroupHipFile=([task_label{task} condStr 'MaxMuscleTorqueGroupHip.xls']);
        SubAvgMaxMuscleTorqueGroupAnkleFile=([task_label{task} condStr 'MaxMuscleTorqueGroupAnkle.xls']);

         
        %need to check if this task exists for this subject
        if exist(SubAvgMFGroupFile)==2 %file does exist. FE can be generalized to all files.
                %read in tables created from averageTrials
                 
                SubAvgFE=readtable(SubAvgFEFile);
                SubAvgIK=readtable(SubAvgIKFile);
                SubAvgID_BW=readtable(SubAvgID_BWFile);
                SubAvgGRF_BW=readtable(SubAvgGRF_BWFile);
                SubAvgMF_BW=readtable(SubAvgMF_BWFile);
                SubAvgMFGroup=readtable(SubAvgMFGroupFile);
                SubAvgFlex=readtable(SubAvgFlexFile);
                SubAvgPower=readtable(SubAvgPowerFile);
                SubAvgWork=readtable(SubAvgWorkFile);
                SubAvgAngVel=readtable(SubAvgAngVelFile);
                SubAvgAngImp=readtable(SubAvgAngImpFile);
                SubAvgMuscleTorque=readtable(SubAvgMuscleTorqueFile);
                SubAvgMuscleTorqueHip=readtable(SubAvgMuscleTorqueHipFile);
                SubAvgMuscleTorqueAnkle=readtable(SubAvgMuscleTorqueAnkleFile);
                SubAvgRMSTorques=readtable(SubAvgRMSTorquesFile);
                SubAvgMuscleTorqueGroupKnee=readtable(SubAvgMuscleTorqueGroupKneeFile);
                SubAvgMuscleTorqueGroupHip=readtable(SubAvgMuscleTorqueGroupHipFile);
                SubAvgMuscleTorqueGroupAnkle=readtable(SubAvgMuscleTorqueGroupAnkleFile);
                
                
                SubAvgMaxGRF=readtable(SubAvgMaxGRFFile);
                SubAvgMaxID=readtable(SubAvgMaxIDFile);
                SubAvgMaxIK=readtable(SubAvgMaxIKFile);
                SubAvgMaxMF=readtable(SubAvgMaxMFFile);
                SubAvgMaxMFGroup=readtable(SubAvgMaxMFGroupFile);
                SubAvgMaxPower=readtable(SubAvgMaxPowerFile);
                SubAvgMaxAngVel=readtable(SubAvgMaxAngVelFile);
                SubAvgMaxMuscleTorqueGroupKnee=readtable(SubAvgMaxMuscleTorqueGroupKneeFile);
                SubAvgMaxMuscleTorqueGroupHip=readtable(SubAvgMaxMuscleTorqueGroupHipFile);
                SubAvgMaxMuscleTorqueGroupAnkle=readtable(SubAvgMaxMuscleTorqueGroupAnkleFile);
                    
                switch whichLeg
                        %NOTE: THIS SHOULD BE CHANGED FOR SINGLE-LEG LANDING!!!
                        case 'right'
                        
                        case 'left'
                            SubAvgGRF_BWtemp=SubAvgGRF_BW;
                            SubAvgGRF_BWtemp(:,2:7)=SubAvgGRF_BW(:,8:13);
                            SubAvgGRF_BWtemp(:,8:13)=SubAvgGRF_BW(:,2:7);
                            SubAvgGRF_BW=SubAvgGRF_BWtemp;
                            
                            SubAvgID_BWtemp=SubAvgID_BW;
                            SubAvgID_BWtemp(:,8:14)=SubAvgID_BW(:,15:21);
                            SubAvgID_BWtemp(:,15:21)=SubAvgID_BW(:,8:14);
                            SubAvgID_BW=SubAvgID_BWtemp;
                            
                            SubAvgIKtemp=SubAvgIK;
                            SubAvgIKtemp(:,8:14)=SubAvgIK(:,15:21);
                            SubAvgIKtemp(:,15:21)=SubAvgIK(:,8:14);
                            SubAvgIK=SubAvgIKtemp;
                            
                            SubAvgMF_BWtemp=SubAvgMF_BW;
                            SubAvgMF_BWtemp(:,2:44)=SubAvgMF_BW(:,45:87);
                            SubAvgMF_BWtemp(:,45:87)=SubAvgMF_BW(:,2:44);
                            SubAvgMF_BWtemp(:,88)=SubAvgMF_BW(:,89);
                            SubAvgMF_BWtemp(:,89)=SubAvgMF_BW(:,88);
                            SubAvgMF_BWtemp(:,90)=SubAvgMF_BW(:,91);
                            SubAvgMF_BWtemp(:,91)=SubAvgMF_BW(:,90);
                            SubAvgMF_BWtemp(:,92)=SubAvgMF_BW(:,93);
                            SubAvgMF_BWtemp(:,93)=SubAvgMF_BW(:,92);
                            SubAvgMF_BWtemp(:,100:106)=SubAvgMF_BW(:,107:113);
                            SubAvgMF_BWtemp(:,107:113)=SubAvgMF_BW(:,100:106);
                            SubAvgMF_BW=SubAvgMF_BWtemp;
                            
                            SubAvgMuscleTorquetemp=SubAvgMuscleTorque;
                            SubAvgMuscleTorquetemp(:,2:44)=SubAvgMuscleTorque(:,45:87);
                            SubAvgMuscleTorquetemp(:,45:87)=SubAvgMuscleTorque(:,2:44);
                            SubAvgMuscleTorquetemp(:,88)=SubAvgMuscleTorque(:,89);
                            SubAvgMuscleTorquetemp(:,89)=SubAvgMuscleTorque(:,88);
                            SubAvgMuscleTorquetemp(:,90)=SubAvgMuscleTorque(:,91);
                            SubAvgMuscleTorquetemp(:,91)=SubAvgMuscleTorque(:,90);
                            SubAvgMuscleTorquetemp(:,92)=SubAvgMuscleTorque(:,93);
                            SubAvgMuscleTorquetemp(:,93)=SubAvgMuscleTorque(:,92);
                            SubAvgMuscleTorque=SubAvgMuscleTorquetemp;

                            SubAvgMuscleTorqueHiptemp=SubAvgMuscleTorqueHip;
                            SubAvgMuscleTorqueHiptemp(:,2:44)=SubAvgMuscleTorqueHip(:,45:87);
                            SubAvgMuscleTorqueHiptemp(:,45:87)=SubAvgMuscleTorqueHip(:,2:44);
                            SubAvgMuscleTorqueHiptemp(:,88)=SubAvgMuscleTorqueHip(:,89);
                            SubAvgMuscleTorqueHiptemp(:,89)=SubAvgMuscleTorqueHip(:,88);
                            SubAvgMuscleTorqueHiptemp(:,90)=SubAvgMuscleTorqueHip(:,91);
                            SubAvgMuscleTorqueHiptemp(:,91)=SubAvgMuscleTorqueHip(:,90);
                            SubAvgMuscleTorqueHiptemp(:,92)=SubAvgMuscleTorqueHip(:,93);
                            SubAvgMuscleTorqueHiptemp(:,93)=SubAvgMuscleTorqueHip(:,92);
                            SubAvgMuscleTorqueHip=SubAvgMuscleTorqueHiptemp;
                            
                            SubAvgMuscleTorqueAnkletemp=SubAvgMuscleTorqueAnkle;
                            SubAvgMuscleTorqueAnkletemp(:,2:44)=SubAvgMuscleTorqueAnkle(:,45:87);
                            SubAvgMuscleTorqueAnkletemp(:,45:87)=SubAvgMuscleTorqueAnkle(:,2:44);
                            SubAvgMuscleTorqueAnkletemp(:,88)=SubAvgMuscleTorqueAnkle(:,89);
                            SubAvgMuscleTorqueAnkletemp(:,89)=SubAvgMuscleTorqueAnkle(:,88);
                            SubAvgMuscleTorqueAnkletemp(:,90)=SubAvgMuscleTorqueAnkle(:,91);
                            SubAvgMuscleTorqueAnkletemp(:,91)=SubAvgMuscleTorqueAnkle(:,90);
                            SubAvgMuscleTorqueAnkletemp(:,92)=SubAvgMuscleTorqueAnkle(:,93);
                            SubAvgMuscleTorqueAnkletemp(:,93)=SubAvgMuscleTorqueAnkle(:,92);
                            SubAvgMuscleTorqueAnkle=SubAvgMuscleTorqueAnkletemp;
                                                                                    
                            SubAvgPowertemp=SubAvgPower;
                            SubAvgPowertemp(:,8:14)=SubAvgPower(:,15:21);
                            SubAvgPowertemp(:,15:21)=SubAvgPower(:,8:14);
                            SubAvgPower=SubAvgPowertemp;
                            
                            SubAvgWorktemp=SubAvgWork;
                            SubAvgWorktemp(:,8:14)=SubAvgWork(:,15:21);
                            SubAvgWorktemp(:,15:21)=SubAvgWork(:,8:14);
                            SubAvgWork=SubAvgWorktemp;
                            
                            SubAvgAngVeltemp=SubAvgAngVel;
                            SubAvgAngVeltemp(:,8:14)=SubAvgAngVel(:,15:21);
                            SubAvgAngVeltemp(:,15:21)=SubAvgAngVel(:,8:14);
                            SubAvgAngVel=SubAvgAngVeltemp;
                            
                            SubAvgAngImptemp=SubAvgAngImp;
                            SubAvgAngImptemp(:,8:14)=SubAvgAngImp(:,15:21);
                            SubAvgAngImptemp(:,15:21)=SubAvgAngImp(:,8:14);
                            SubAvgAngImp=SubAvgAngImptemp;
                            
                            %same for max values
                            SubAvgMaxGRFtemp=SubAvgMaxGRF;
                            SubAvgMaxGRFtemp(:,2:7)=SubAvgMaxGRF(:,8:13);
                            SubAvgMaxGRFtemp(:,8:13)=SubAvgMaxGRF(:,2:7);
                            SubAvgMaxGRF=SubAvgMaxGRFtemp;
                            
                            SubAvgMaxIDtemp=SubAvgMaxID;
                            SubAvgMaxIDtemp(:,8:14)=SubAvgMaxID(:,15:21);
                            SubAvgMaxIDtemp(:,15:21)=SubAvgMaxID(:,8:14);
                            SubAvgMaxID=SubAvgMaxIDtemp;
                            
                            SubAvgMaxIKtemp=SubAvgMaxIK;
                            SubAvgMaxIKtemp(:,8:14)=SubAvgMaxIK(:,15:21);
                            SubAvgMaxIKtemp(:,15:21)=SubAvgMaxIK(:,8:14);
                            SubAvgMaxIK=SubAvgMaxIKtemp;
                            
                            SubAvgMaxMFtemp=SubAvgMaxMF;
                            SubAvgMaxMFtemp(:,2:44)=SubAvgMaxMF(:,45:87);
                            SubAvgMaxMFtemp(:,45:87)=SubAvgMaxMF(:,2:44);
                            SubAvgMaxMFtemp(:,88)=SubAvgMaxMF(:,89);
                            SubAvgMaxMFtemp(:,89)=SubAvgMaxMF(:,88);
                            SubAvgMaxMFtemp(:,90)=SubAvgMaxMF(:,91);
                            SubAvgMaxMFtemp(:,91)=SubAvgMaxMF(:,90);
                            SubAvgMaxMFtemp(:,92)=SubAvgMaxMF(:,93);
                            SubAvgMaxMFtemp(:,93)=SubAvgMaxMF(:,92);
                            SubAvgMaxMFtemp(:,100:106)=SubAvgMaxMF(:,107:113);
                            SubAvgMaxMFtemp(:,107:113)=SubAvgMaxMF(:,100:106);
                            SubAvgMaxMF=SubAvgMaxMFtemp;
                            
                            SubAvgMaxPowertemp=SubAvgMaxPower;
                            SubAvgMaxPowertemp(:,8:14)=SubAvgMaxPower(:,15:21);
                            SubAvgMaxPowertemp(:,15:21)=SubAvgMaxPower(:,8:14);
                            SubAvgMaxPower=SubAvgMaxPowertemp;
                            
                            SubAvgMaxAngVeltemp=SubAvgMaxAngVel;
                            SubAvgMaxAngVeltemp(:,8:14)=SubAvgMaxAngVel(:,15:21);
                            SubAvgMaxAngVeltemp(:,15:21)=SubAvgMaxAngVel(:,8:14);
                            SubAvgMaxAngVel=SubAvgMaxAngVeltemp;
                            
                end
                                       
                
                %create structure with subject data. 
                AllSubjects=setfield(AllSubjects,{i}, 'FE', SubAvgFE);
                AllSubjects=setfield(AllSubjects,{i}, 'IK', SubAvgIK);
                AllSubjects=setfield(AllSubjects,{i}, 'ID_BW', SubAvgID_BW);
                AllSubjects=setfield(AllSubjects,{i}, 'GRF_BW', SubAvgGRF_BW);
                AllSubjects=setfield(AllSubjects,{i}, 'MF_BW', SubAvgMF_BW);
                AllSubjects=setfield(AllSubjects,{i}, 'MFGroup', SubAvgMFGroup);
                AllSubjects=setfield(AllSubjects,{i}, 'FLEX', SubAvgFlex);
                AllSubjects=setfield(AllSubjects,{i}, 'Power', SubAvgPower);
                AllSubjects=setfield(AllSubjects,{i}, 'Work', SubAvgWork);
                AllSubjects=setfield(AllSubjects,{i}, 'AngVel', SubAvgAngVel);
                AllSubjects=setfield(AllSubjects,{i}, 'AngImp', SubAvgAngImp);
                AllSubjects=setfield(AllSubjects,{i}, 'MuscleTorque', SubAvgMuscleTorque);
                AllSubjects=setfield(AllSubjects,{i}, 'MuscleTorqueHip', SubAvgMuscleTorqueHip);
                AllSubjects=setfield(AllSubjects,{i}, 'MuscleTorqueAnkle', SubAvgMuscleTorqueAnkle);
                AllSubjects=setfield(AllSubjects,{i}, 'AllRMSTorques', SubAvgRMSTorques);
                AllSubjects=setfield(AllSubjects,{i}, 'MuscleTorqueGroupKnee', SubAvgMuscleTorqueGroupKnee);
                AllSubjects=setfield(AllSubjects,{i}, 'MuscleTorqueGroupHip', SubAvgMuscleTorqueGroupHip);
                AllSubjects=setfield(AllSubjects,{i}, 'MuscleTorqueGroupAnkle', SubAvgMuscleTorqueGroupAnkle);
                
                AllSubjects=setfield(AllSubjects,{i}, 'MaxGRF', SubAvgMaxGRF);
                AllSubjects=setfield(AllSubjects,{i}, 'MaxID', SubAvgMaxID);
                AllSubjects=setfield(AllSubjects,{i}, 'MaxIK', SubAvgMaxIK);
                AllSubjects=setfield(AllSubjects,{i}, 'MaxMF', SubAvgMaxMF);
                AllSubjects=setfield(AllSubjects,{i}, 'MaxMFGroup', SubAvgMaxMFGroup);
                AllSubjects=setfield(AllSubjects,{i}, 'MaxPower', SubAvgMaxPower);
                AllSubjects=setfield(AllSubjects,{i}, 'MaxAngVel', SubAvgMaxAngVel);
                AllSubjects=setfield(AllSubjects,{i}, 'MaxMuscleTorqueGroupKnee', SubAvgMaxMuscleTorqueGroupKnee);
                AllSubjects=setfield(AllSubjects,{i}, 'MaxMuscleTorqueGroupHip', SubAvgMaxMuscleTorqueGroupHip);
                AllSubjects=setfield(AllSubjects,{i}, 'MaxMuscleTorqueGroupAnkle', SubAvgMaxMuscleTorqueGroupAnkle);

                
                
                i= i+1;
        else
                AllSubjects=setfield(AllSubjects,{i}, 'FE', []);
                AllSubjects=setfield(AllSubjects,{i}, 'IK', []);
                AllSubjects=setfield(AllSubjects,{i}, 'ID_BW', []);
                AllSubjects=setfield(AllSubjects,{i}, 'GRF_BW', []);
                AllSubjects=setfield(AllSubjects,{i}, 'MF_BW', []);
                AllSubjects=setfield(AllSubjects,{i}, 'MFGroup', []);
                AllSubjects=setfield(AllSubjects,{i}, 'FLEX', []);
                AllSubjects=setfield(AllSubjects,{i}, 'Power', []);
                AllSubjects=setfield(AllSubjects,{i}, 'Work', []);
                AllSubjects=setfield(AllSubjects,{i}, 'AngVel', []);
                AllSubjects=setfield(AllSubjects,{i}, 'AngImp', []);
                AllSubjects=setfield(AllSubjects,{i}, 'MuscleTorque', []);
                AllSubjects=setfield(AllSubjects,{i}, 'MuscleTorqueHip', []);
                AllSubjects=setfield(AllSubjects,{i}, 'MuscleTorqueAnkle', []);
                AllSubjects=setfield(AllSubjects,{i}, 'AllRMSTorques', []);
                AllSubjects=setfield(AllSubjects,{i}, 'MuscleTorqueGroupKnee', []);
                AllSubjects=setfield(AllSubjects,{i}, 'MuscleTorqueGroupHip', []);
                AllSubjects=setfield(AllSubjects,{i}, 'MuscleTorqueGroupAnkle', []);



                AllSubjects=setfield(AllSubjects,{i}, 'MaxGRF', []);
                AllSubjects=setfield(AllSubjects,{i}, 'MaxID', []);
                AllSubjects=setfield(AllSubjects,{i}, 'MaxIK', []);
                AllSubjects=setfield(AllSubjects,{i}, 'MaxMF', []);
                AllSubjects=setfield(AllSubjects,{i}, 'MaxMFGroup', []);
                AllSubjects=setfield(AllSubjects,{i}, 'MaxPower', []);
                AllSubjects=setfield(AllSubjects,{i}, 'MaxAngVel', []);
                AllSubjects=setfield(AllSubjects,{i}, 'MaxMuscleTorqueGroupKnee', []);
                AllSubjects=setfield(AllSubjects,{i}, 'MaxMuscleTorqueGroupHip', []);
                AllSubjects=setfield(AllSubjects,{i}, 'MaxMuscleTorqueGroupAnkle', []);

                i = i+1;
            %if files do NOT exist for this task and this subject,
            %AllSubjects will remain blank.
            
        end
        
        %clear files for next subject
        clearvars SubAvgFEFile SubAvgIKFile SubAvgID_BWFile SubAvgGRF_BWFile SubAvgMF_BWFile SubAvgMFGroupFile SubAvgFlexFile SubAvgPowerFile SubAvgWorkFile SubAvgAngVelFile SubAvgAngImpFile 
        clearvars SubAvgMaxGRFFile SubAvgMaxIDFile SubAvgMaxIKFile SubAvgMaxMFFile SubAvgMaxMFGroupFile SubAvgMaxPowerFile SubAvgMaxAngVelFile SubAvgMuscleTorqueFile SubAvgMuscleTorqueHipFile SubAvgMuscleTorqueAnkleFile  SubAvgRMSTorquesFile
       clearvars SubAvgMuscleTorqueGroupKneeFile SubAvgMuscleTorqueGroupHipFile SubAvgMuscleTorqueGroupAnkleFile
       clearvars SubAvgMaxMuscleTorqueGroupKneeFile SubAvgMaxMuscleTorqueGroupHipFile SubAvgMaxMuscleTorqueGroupAnkleFile
       
       
       end %end of subject while loop
       
       %Should now have a structure, AllSubjects, that contains all of the
       %tables for all of the subjects. Each subject will be in a different
       %row and each table will be in a different column. If a subject did not perform a specific task, the row will be
       %blank.
       
          
cd(DirSubAvg);
cd(char(task_label(task)));

fieldNames = {'FE', 'IK', 'ID_BW', 'GRF_BW', 'MF_BW', 'MFGroup', 'FLEX', 'Power', 'Work','AngVel', 'AngImp', 'MuscleTorque', 'MuscleTorqueHip','MuscleTorqueAnkle', 'AllRMSTorques', 'MuscleTorqueGroupKnee', 'MuscleTorqueGroupHip','MuscleTorqueGroupAnkle','MaxGRF', 'MaxID', 'MaxIK', 'MaxMF', 'MaxMFGroup','MaxPower','MaxAngVel', 'MaxMuscleTorqueGroupKnee', 'MaxMuscleTorqueGroupHip','MaxMuscleTorqueGroupAnkle'};

% fieldNames={'MFGroup', 'MaxMFGroup'};
% if isempty(AllSubjects)==1 %if NONE of the subjects performed a task, AllSubjects will be blank
%                            %and loop will move to next task. e.g. Sub 1 and
%                            %2 did not perform SLND60
%     task=task+1;
% else
    
    for a=1:length(fieldNames) 
        c=1;
        while size(AllSubjects(c).(char(fieldNames(a))), 2)==0  %Checking if AllSubjects(1) exists.
            %if Subject 1 did not perform task, will move to next subject.
            %This is only the case for SJ, which Subject 1 did not perform.
            c=c+1;
            
              if c > length(whichSubjects)
               break
              end
            
        end
            if c > length(whichSubjects)
                task=task+1;
                break;
                
            else
        
            vars=AllSubjects(c).(char(fieldNames(a))).Properties.VariableNames;  %Gets all variable names of each field
            for b = 1:size(AllSubjects(c).(char(fieldNames(a))), 2)  %Number of variables e.g. 13, 24, 24, 13, 116
                Temp=table(); %creates empty temporary table
                j=1;
                d=1;
                    while j<=length(whichSubjects) %not sure if less than or less than or equal to
                        if size(AllSubjects(j).(char(fieldNames(a))), 2)==0  %checking if subject performed task.
                            %If subject did not perform task, will move on
                            %to next subject.
                           if j==1
                               d=j;
                           end
                           
                            j=j+1;
                        else

                         Temp(:,d)= AllSubjects(j).(char(fieldNames(a)))(:,b);
                         d=d+1;
                         j=j+1;
                        end

                    end
                
             Temp=table2array(Temp);
             SubjectAverage(:,b) = mean(Temp, 2);
             SubjectStdDev(:,b)=std(Temp,0,2);

        end

        SubjectAverageTable=array2table(SubjectAverage, 'VariableNames',vars);
        writetable(SubjectAverageTable,['SubAvg_' task_label{task} condStr fieldNames{a} '.xls']);
        clearvars SubjectAverage  SubjectAverageTable; %clears variables for next task
        
        SubjectStdDevTable=array2table(SubjectStdDev, 'VariableNames',vars);
        writetable(SubjectStdDevTable,['SubStd_' task_label{task} condStr fieldNames{a} '.xls']);
        clearvars SubjectStdDev  SubjectStdDevTable; %clears variables for next task

    end
    
end

end
    

end

     