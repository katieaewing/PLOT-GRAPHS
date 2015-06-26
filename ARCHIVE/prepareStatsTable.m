%% ARCHIVE?!

% This function averages all data (average of trials) across a range of Subjects.
% Data must be in the folders created from the function averageTrials.
% Input: subjects you want to average i.e. [1:10]
%        brace condition i.e. 1 for no brace, 2 for brace

function prepareStatsTable(whichSubjects)

task_label = {'SL30'; 'SL60'; 'SLND30'; 'SLND60'; 'DL30'; 'DL60'; 'SJ'};
leg = {'right'; 'right'; 'right' ; 'right'; 'right'; 'left' ; 'right'  ; 'right' ; 'left' ; 'right' ; 'right'  ; 'right' ; 'right' ; 'right' ; 'right'};

brace=1;
for brace = [1 2]
for task=[5 6]
%     1:length(task_label) %a2verage subjects one task at a time

       AllSubjects=[]; %create empty array
       statsTable=[];
       statsTable=setfield(statsTable,{1}, 'MaxGRF', []);
        statsTable=setfield(statsTable,{1}, 'MaxID', []);
        statsTable=setfield(statsTable,{1}, 'MaxIK', []);
        statsTable=setfield(statsTable,{1}, 'MaxMF', []);
       
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
        
        % and for maximum value tables
        SubAvgMaxGRFFile=([task_label{task} condStr 'MaxGRF.xls']);
        SubAvgMaxIDFile=([task_label{task} condStr 'MaxID.xls']);
        SubAvgMaxIKFile=([task_label{task} condStr 'MaxIK.xls']);
        SubAvgMaxMFFile=([task_label{task} condStr 'MaxMF.xls']);
        
         
        %need to check if this task exists for this subject
        if exist(SubAvgMaxGRFFile)==2 %file does exist. FE can be generalized to all files.
                %read in tables created from averageTrials
                
                SubAvgMaxGRF=readtable(SubAvgMaxGRFFile);
                SubAvgMaxID=readtable(SubAvgMaxIDFile);
                SubAvgMaxIK=readtable(SubAvgMaxIKFile);
                SubAvgMaxMF=readtable(SubAvgMaxMFFile);
                    
                switch whichLeg
                        
                        case 'right'
                        
                        case 'left'
                        
                            
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
                            
                end
                                       
                
                %create structure with subject data. 
                AllSubjects=setfield(AllSubjects,{i}, 'MaxGRF', SubAvgMaxGRF);
                AllSubjects=setfield(AllSubjects,{i}, 'MaxID', SubAvgMaxID);
                AllSubjects=setfield(AllSubjects,{i}, 'MaxIK', SubAvgMaxIK);
                AllSubjects=setfield(AllSubjects,{i}, 'MaxMF', SubAvgMaxMF);
                
                
                i= i+1;
        else
                
                AllSubjects=setfield(AllSubjects,{i}, 'MaxGRF', []);
                AllSubjects=setfield(AllSubjects,{i}, 'MaxID', []);
                AllSubjects=setfield(AllSubjects,{i}, 'MaxIK', []);
                AllSubjects=setfield(AllSubjects,{i}, 'MaxMF', []);
                
                i = i+1;
            %if files do NOT exist for this task and this subject,
            %AllSubjects will remain blank.
            
        end
        
        %clear files for next subject

        clearvars SubAvgMaxGRFFile SubAvgMaxIDFile SubAvgMaxIKFile SubAvgMaxMFFile
       
       end %end of subject while loop
       
       %Should now have a structure, AllSubjects, that contains all of the
       %tables for all of the subjects. Each subject will be in a different
       %row and each table will be in a different column. If a subject did not perform a specific task, the row will be
       %blank.
       
          
cd(DirSubAvg);
cd(char(task_label(task)));

fieldNames = {'MaxGRF', 'MaxID', 'MaxIK', 'MaxMF'};

% if isempty(AllSubjects)==1 %if NONE of the subjects performed a task, AllSubjects will be blank
%                            %and loop will move to next task. e.g. Sub 1 and
%                            %2 did not perform SLND60
%     task=task+1;
% else

statsTemp=[]
statsTemp=setfield(statsTemp,{1}, 'MaxGRF', []);
statsTemp=setfield(statsTemp,{1}, 'MaxID', []);
statsTemp=setfield(statsTemp,{1}, 'MaxIK', []);
statsTemp=setfield(statsTemp,{1}, 'MaxMF', []);
                
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
                
             Temp=table2array(Temp); %should have all subjects
             statsTempTime.(char(fieldNames(a)))(:,b)=Temp(1,:)';
             statsTempMag.(char(fieldNames(a)))(:,b)=Temp(2,:)';
            
%             statsTable=statsTemp;
             
             end

        end
    
    end %field names

%     for bb=1:size(AllSubjects(c).(char(fieldNames(a))), 2)
%         
%     statsTable(:bb)=[[statsTemp]; statsTable]  %for non-brace, contains tasks 5 and 6
    
end
%     statsTable2=statsTable;
%     statsTable2=

end

     