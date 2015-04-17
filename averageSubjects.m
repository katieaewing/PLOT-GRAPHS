% This function averages all data (average of trials) across a range of Subjects.
% Data must be in the folders created from the function averageTrials.
% Input: subjects you want to average i.e. [1:10]
%        brace condition i.e. 1 for no brace, 2 for brace

function averageSubjects(whichSubjects, brace)

task_label = {'SL30'; 'SL60'; 'SLND30'; 'SLND60'; 'DL30'; 'DL60'; 'SJ'};

for task=[5 6]
%     1:length(task_label) %average subjects one task at a time

       AllSubjects=[]; %create empty array
       i=1;
       while i <=length(whichSubjects) 
           
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
        SubAvgFlexFile=([task_label{task} condStr 'FLEX.xls']);
        
        % and for maximum value tables
        SubAvgMaxGRFFile=([task_label{task} condStr 'MaxGRF.xls']);
        SubAvgMaxIDFile=([task_label{task} condStr 'MaxID.xls']);
        SubAvgMaxIKFile=([task_label{task} condStr 'MaxIK.xls']);
        SubAvgMaxMFFile=([task_label{task} condStr 'MaxMF.xls']);
        
         
        %need to check if this task exists for this subject
        if exist(SubAvgFEFile)==2 %file does exist. FE can be generalized to all files.
                %read in tables created from averageTrials
                SubAvgFE=readtable(SubAvgFEFile);
                SubAvgIK=readtable(SubAvgIKFile);
                SubAvgID_BW=readtable(SubAvgID_BWFile);
                SubAvgGRF_BW=readtable(SubAvgGRF_BWFile);
                SubAvgMF_BW=readtable(SubAvgMF_BWFile);
                SubAvgFlex=readtable(SubAvgFlexFile);
                
                SubAvgMaxGRF=readtable(SubAvgMaxGRFFile);
                SubAvgMaxID=readtable(SubAvgMaxIDFile);
                SubAvgMaxIK=readtable(SubAvgMaxIKFile);
                SubAvgMaxMF=readtable(SubAvgMaxMFFile);
                
                
                %create structure with subject data. 
                AllSubjects=setfield(AllSubjects,{i}, 'FE', SubAvgFE);
                AllSubjects=setfield(AllSubjects,{i}, 'IK', SubAvgIK);
                AllSubjects=setfield(AllSubjects,{i}, 'ID_BW', SubAvgID_BW);
                AllSubjects=setfield(AllSubjects,{i}, 'GRF_BW', SubAvgGRF_BW);
                AllSubjects=setfield(AllSubjects,{i}, 'MF_BW', SubAvgMF_BW);
                AllSubjects=setfield(AllSubjects,{i}, 'FLEX', SubAvgFlex);
                
                AllSubjects=setfield(AllSubjects,{i}, 'MaxGRF', SubAvgMaxGRF);
                AllSubjects=setfield(AllSubjects,{i}, 'MaxID', SubAvgMaxID);
                AllSubjects=setfield(AllSubjects,{i}, 'MaxIK', SubAvgMaxIK);
                AllSubjects=setfield(AllSubjects,{i}, 'MaxMF', SubAvgMaxMF);
                
                
                i= i+1;
        else
                AllSubjects=setfield(AllSubjects,{i}, 'FE', []);
                AllSubjects=setfield(AllSubjects,{i}, 'IK', []);
                AllSubjects=setfield(AllSubjects,{i}, 'ID_BW', []);
                AllSubjects=setfield(AllSubjects,{i}, 'GRF_BW', []);
                AllSubjects=setfield(AllSubjects,{i}, 'MF_BW', []);
                AllSubjects=setfield(AllSubjects,{i}, 'FLEX', []);
                
                llSubjects=setfield(AllSubjects,{i}, 'MaxGRF', []);
                AllSubjects=setfield(AllSubjects,{i}, 'MaxID', []);
                AllSubjects=setfield(AllSubjects,{i}, 'MaxIK', []);
                AllSubjects=setfield(AllSubjects,{i}, 'MaxMF', []);
                
                i = i+1;
            %if files do NOT exist for this task and this subject,
            %AllSubjects will remain blank.
            
        end
        
        %clear files for next subject
        clearvars SubAvgFEFile SubAvgIKFile SubAvgID_BWFile SubAvgGRF_BWFile SubAvgMF_BWFile SubAvgFlexFile 
        clearvars SubAvgMaxGRFFile SubAvgMaxIDFile SubAvgMaxIKFile SubAvgMaxMFFile
       
       end %end of subject while loop
       
       %Should now have a structure, AllSubjects, that contains all of the
       %tables for all of the subjects. Each subject will be in a different
       %row. If a subject did not perform a specific task, the row will be
       %blank.
       
          
cd(DirSubAvg);
cd(char(task_label(task)));

fieldNames = {'FE', 'IK', 'ID_BW', 'GRF_BW', 'MF_BW', 'FLEX', 'MaxGRF', 'MaxID', 'MaxIK', 'MaxMF'};

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

     