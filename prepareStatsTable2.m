% Created by: Katie Ewing
% May 2015 
% 
% This function extracts all data (average of trials) from all the subjects
% from ONE task and ONE brace condition. It is called multiple times by the
% function, finalStats.m, to extract multiple conditions and tasks.
%
% Input: whichSubjects = which subjects to average e.g. [1:14]
%        brace = brace condition e.g. 1 (no brace) or 2 (brace)
%        task = which task
% Ouput: statsTempMag = temporary structure with the magnitudes of all fields (e.g. knee flexion angles at three...
        ...time points, GRF data, IK data, etc.) with each subject in a different row. Missing subjects will appear as 0s.
%        statsTempMag = temporary structure with the time of the magnitudes
%        of all the fields (does not include three knee flexion angles
%        field)
% Example: [statsTempMag, statsTempTime, fieldNames, AllSubjects] = prepareStatsTable2([1:15], 1, 5)


function [statsTempMag, statsTempTime, fieldNames, AllSubjects] = prepareStatsTable2(whichSubjects, brace, task)

task_label = {'SL30'; 'SL60'; 'SLND30'; 'SLND60'; 'DL30'; 'DL60'; 'SJ'};
leg = {'right'; 'right'; 'right' ; 'right'; 'right'; 'left' ; 'right'  ; 'right' ; 'left' ; 'right' ; 'right'  ; 'right' ; 'right' ; 'right' ; 'right'};

AllSubjects=[]; %create empty array
       
   i=1;
   while i <=length(whichSubjects) 
       whichLeg = char(leg(whichSubjects(i)));
       Dir=['C:\MyOpenSim4','\Subject_',int2str(whichSubjects(i))]; %change to subject directory

        switch brace %switch case depending on brace condition

            case 1
                DirAvg=[Dir,'\NO BRACE\AVERAGES']; %This folder is already created
                condStr='_';
%                     DirSubAvg='C:\MyOpenSim4\SUBJECT_AVERAGES';                

            case 2
                DirAvg=[Dir,'\BRACE\AVERAGES']; %This folder is already created
                condStr='_Brace_';
%                     DirSubAvg='C:\MyOpenSim4\SUBJECT_AVERAGES_BRACE'; 

        end

    cd(DirAvg);  

        %create file names of averaged trials (correspond to tables created
        %from averageTrials).
        
        SubAvgFlexAtICFile=([task_label{task} condStr 'FlexAtIC.xls']);
        SubAvgFlexAtPeakGRFFile=([task_label{task} condStr 'FlexAtPeakGRF.xls']);
        SubAvgFlexFile=([task_label{task} condStr 'FLEX.xls']);
        SubAvgWorkFile=([task_label{task} condStr 'Work.xls']);
        SubAvgAngImpFile=([task_label{task} condStr 'AngImp.xls']);
        SubAvgPercentJointWorkFile=([task_label{task} condStr 'PercentJointWork.xls']);
        
        % maximum value tables
        SubAvgMaxGRFFile=([task_label{task} condStr 'MaxGRF.xls']);
        SubAvgMaxIDFile=([task_label{task} condStr 'MaxID.xls']);
        SubAvgMaxIKFile=([task_label{task} condStr 'MaxIK.xls']);
        SubAvgMaxMFFile=([task_label{task} condStr 'MaxMF.xls']);
        SubAvgMaxPowerFile=([task_label{task} condStr 'MaxPower.xls']);
        SubAvgMaxAngVelFile=([task_label{task} condStr 'MaxAngVel.xls']);
        
         
        %need to check if this task exists for this subject
        if exist(SubAvgMaxGRFFile)==2 %file does exist. FE can be generalized to all files.
                %read in tables created from averageTrials
                SubAvgFlexAtIC=readtable(SubAvgFlexAtICFile);
                SubAvgFlexAtPeakGRF=readtable(SubAvgFlexAtPeakGRFFile);
                SubAvgFlex=readtable(SubAvgFlexFile);
                SubAvgWork=readtable(SubAvgWorkFile);
                SubAvgAngImp=readtable(SubAvgAngImpFile);
                SubAvgPercentJointWork=readtable(SubAvgPercentJointWorkFile);
                
                %for maximums
                SubAvgMaxGRF=readtable(SubAvgMaxGRFFile);
                SubAvgMaxID=readtable(SubAvgMaxIDFile);
                SubAvgMaxIK=readtable(SubAvgMaxIKFile);
                SubAvgMaxMF=readtable(SubAvgMaxMFFile);
                SubAvgMaxPower=readtable(SubAvgMaxPowerFile);
                SubAvgMaxAngVel=readtable(SubAvgMaxAngVelFile);
                    
                switch whichLeg
                        
                        case 'right'
                        
                        case 'left'
                                                                                
                            SubAvgFlexAtICtemp=SubAvgFlexAtIC;
                            SubAvgFlexAtICtemp(:,8:14)=SubAvgFlexAtIC(:,15:21);
                            SubAvgFlexAtICtemp(:,15:21)=SubAvgFlexAtIC(:,8:14);
                            SubAvgFlexAtIC=SubAvgFlexAtICtemp;
                            
                            SubAvgFlexAtPeakGRFtemp=SubAvgFlexAtPeakGRF;
                            SubAvgFlexAtPeakGRFtemp(:,8:14)=SubAvgFlexAtPeakGRF(:,15:21);
                            SubAvgFlexAtPeakGRFtemp(:,15:21)=SubAvgFlexAtPeakGRF(:,8:14);
                            SubAvgFlexAtPeakGRF=SubAvgFlexAtPeakGRFtemp;
                         
                       
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
                
                AllSubjects=setfield(AllSubjects,{i}, 'FlexAtIC', SubAvgFlexAtIC);
                AllSubjects=setfield(AllSubjects,{i}, 'FlexAtPeakGRF', SubAvgFlexAtPeakGRF);
                AllSubjects=setfield(AllSubjects,{i}, 'FLEX', SubAvgFlex);
                AllSubjects=setfield(AllSubjects,{i}, 'Work', SubAvgWork);
                AllSubjects=setfield(AllSubjects,{i}, 'AngImp', SubAvgAngImp);
                AllSubjects=setfield(AllSubjects,{i}, 'PercentJointWork', SubAvgPercentJointWork);
                
                %create structure with subject data. 
                AllSubjects=setfield(AllSubjects,{i}, 'MaxGRF', SubAvgMaxGRF);
                AllSubjects=setfield(AllSubjects,{i}, 'MaxID', SubAvgMaxID);
                AllSubjects=setfield(AllSubjects,{i}, 'MaxIK', SubAvgMaxIK);
                AllSubjects=setfield(AllSubjects,{i}, 'MaxMF', SubAvgMaxMF);
                AllSubjects=setfield(AllSubjects,{i}, 'MaxPower', SubAvgMaxPower);
                AllSubjects=setfield(AllSubjects,{i}, 'MaxAngVel', SubAvgMaxAngVel);
                
                i= i+1;
        else
            
                AllSubjects=setfield(AllSubjects,{i}, 'FlexAtIC', []);
                AllSubjects=setfield(AllSubjects,{i}, 'FlexAtPeakGRF',[]);
                AllSubjects=setfield(AllSubjects,{i}, 'FLEX', []);
                AllSubjects=setfield(AllSubjects,{i}, 'Work', []);
                AllSubjects=setfield(AllSubjects,{i}, 'AngImp', []);
                AllSubjects=setfield(AllSubjects,{i}, 'PercentJointWork', []);
                AllSubjects=setfield(AllSubjects,{i}, 'MaxGRF', []);
                AllSubjects=setfield(AllSubjects,{i}, 'MaxID', []);
                AllSubjects=setfield(AllSubjects,{i}, 'MaxIK', []);
                AllSubjects=setfield(AllSubjects,{i}, 'MaxMF', []);
                AllSubjects=setfield(AllSubjects,{i}, 'MaxPower', []);
                AllSubjects=setfield(AllSubjects,{i}, 'MaxAngVel', []);
                
                i = i+1;
            %if files do NOT exist for this task and this subject,
            %AllSubjects will remain blank.
            
        end
        
        %clear files for next subject

        clearvars SubAvgMaxGRFFile SubAvgMaxIDFile SubAvgMaxIKFile SubAvgMaxMFFile SubAvgPercentJointWorkFile...
            SubAvgWorkFile SubAvgAngImpFile SubAvgMaxPowerFile SubAvgMaxAngVelFile SubAvgFlexAtPeakGRFFile SubAvgFlexAtICFile
       
   end %end of subject while loop
       
       %Should now have a structure, AllSubjects, that contains all of the
       %tables for all of the subjects. Each subject will be in a different
       %row and each table will be in a different column. If a subject did not perform a specific task, the row will be
       %blank.
       

fieldNames = {'FlexAtIC', 'FlexAtPeakGRF','FLEX', 'Work', 'AngImp', 'PercentJointWork', 'MaxGRF', 'MaxID', 'MaxIK', 'MaxMF', 'MaxPower', 'MaxAngVel'};

% if isempty(AllSubjects)==1 %if NONE of the subjects performed a task, AllSubjects will be blank
%                            %and loop will move to next task. e.g. Sub 1 and
%                            %2 did not perform SLND60
%     task=task+1;
% else
% 
    
    %create empty structures for the outputs
    statsTempTime=[];
    statsTempTime=setfield(statsTempTime,{1}, 'MaxGRF', []);
    statsTempTime=setfield(statsTempTime,{1}, 'MaxID', []);
    statsTempTime=setfield(statsTempTime,{1}, 'MaxIK', []);
    statsTempTime=setfield(statsTempTime,{1}, 'MaxMF', []);
    statsTempTime=setfield(statsTempTime,{1}, 'MaxPower', []);
    statsTempTime=setfield(statsTempTime,{1}, 'MaxAngVel', []);

    statsTempMag=[]; %has additional fields
    statsTempMag=setfield(statsTempMag,{1}, 'FlexAtIC', []); 
    statsTempMag=setfield(statsTempMag,{1}, 'FlexAtPeakGRF', []); 
    statsTempMag=setfield(statsTempMag,{1}, 'FLEX', []); 
    statsTempMag=setfield(statsTempMag,{1}, 'Work', []); 
    statsTempMag=setfield(statsTempMag,{1}, 'AngImp', []);
    statsTempMag=setfield(statsTempMag,{1}, 'PercentJointWork',[]);
    statsTempMag=setfield(statsTempMag,{1}, 'MaxGRF', []);
    statsTempMag=setfield(statsTempMag,{1}, 'MaxID', []);
    statsTempMag=setfield(statsTempMag,{1}, 'MaxIK', []);
    statsTempMag=setfield(statsTempMag,{1}, 'MaxMF', []);
    statsTempMag=setfield(statsTempMag,{1}, 'MaxPower', []);
    statsTempMag=setfield(statsTempMag,{1}, 'MaxAngVel', []);
    
                
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
        
        if c > length(whichSubjects)  %if all subjects didn't perform a task?
%                 task=task+1; %not sure if needed?
                break;
                
            else
        
            vars=AllSubjects(c).(char(fieldNames(a))).Properties.VariableNames;  %Gets all variable names of each field
            for b = 1:size(AllSubjects(c).(char(fieldNames(a))), 2)  %Number of variables e.g. 13, 24, 24, 13, 116
                Temp=table(); %creates empty temporary table
                j=1;
                d=1;
                    while j<=length(whichSubjects) %not sure if less than or less than or equal to
                        if size(AllSubjects(j).(char(fieldNames(a))), 2)==0  %checking if subject performed task.
                            %If subject did not perform task, will move on to next subject.
                            
                            %Not actually 0, but just a way to create a row in stats table for empty task
                            if a==1 || a==2 || a==3 || a==4 || a==5 || a==6
                                Temp(:,d)={0}; % creates one row with 0 for the FLEX field.
                            else
                                
                                Temp(:,d)= {0;0};  %for all other fields, creates two rows with 0. 
                            end
                            
                           if j==1
                               d=j; %if subject 1 did not perform task, then the first row of Temp needs to be subject 2
                           end
                            d=d+1;
                            j=j+1;
                        else

                         Temp(:,d)= AllSubjects(j).(char(fieldNames(a)))(:,b);
                         d=d+1;
                         j=j+1;
                        end
                    
                    
                    end
                
             Temp=table2array(Temp); %should have all subjects
             
             if a>6
                 statsTempTime.(char(fieldNames(a)))(:,b)=Temp(2,:)'; %time in second row, need to transform into column
             end
             
             statsTempMag.(char(fieldNames(a)))(:,b)=Temp(1,:)'; %magnitude in first row, need to transform into column
             
             end

        end
    
    end %field names

end

     