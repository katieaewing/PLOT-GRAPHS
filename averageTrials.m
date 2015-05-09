function averageTrials(subjectID, brace, myTable)

task_label = {'SL30'; 'SL60'; 'SLND30'; 'SLND60'; 'DL30'; 'DL60'; 'SJ'};
% inputbrace_label = {'NOBRACE'; 'BRACE'};

Dir=['C:\MyOpenSim4','\Subject_',int2str(subjectID)];

switch brace
    
    case 1
        Dir=[Dir,'\NO BRACE'];
        condStr='_';
 
    case 2
        Dir=[Dir,'\BRACE'];
        condStr='_Brace_';
       
end

AllCombined=[];
% VarNames={'GRF_FE', 'FLEX_EXT', 'FLEX_EXT_RAD', 'HAMS_MED', 'HAMS_LAT', 'REC_FEM', 'VAS_MED','VAS_INT', 'VAS_LAT', 'GAS_MED', 'GAS_LAT', 'SOL', 'GRF_TORQ'};
%set up structure with THREE triabls for all tables

for task=[5 6]
%     1:length(myTable)
    trial=myTable(task, 2:4);
    
            if trial==0
                 task=task + 1;
            else

                for i=1:length(trial)

                    if trial(i) == 0
                        task=task+1;
                    else
                        

                switch brace

                    case 1
                        DirTask=[Dir '\' task_label{task} '_' int2str(trial(i)) '\TABLES'];

                    case 2
                        DirTask=[Dir '\' task_label{task} '_Brace_' int2str(trial(i)) '\TABLES'];

                end


                cd(DirTask);

                FEArray=readtable('FE_Model_Inputs.xls');
                IKArray=readtable('IKfinal.xls');
                IDArray=readtable('IDfinal_BW.xls');
                GRFArray=readtable('GRFfinal_BW.xls');
                MFArray=readtable('MFfinal_BW.xls');
                FlexArray=readtable('three_flexion_angles.xls');
                PowerArray=readtable('Power.xls');
                WorkArray=readtable('Work.xls');
                AngVelArray=readtable('AngVel.xls');
                AngImpArray=readtable('AngImp.xls');
                
                
                %also for maximums
                MaxIKArray=readtable('maxIK_mag_time.xls');
                MaxIDArray=readtable('maxID_BW_mag_time.xls');
                MaxGRFArray=readtable('maxGRF_BW_mag_time.xls');
                MaxMFArray=readtable('maxMF_BW_mag_time.xls');
                MaxPowerArray=readtable('maxPower_mag_time.xls');
                MaxAngVelArray=readtable('maxAngVel_mag_time.xls');

                AllCombined=setfield(AllCombined,{i},'FE', FEArray);
                AllCombined=setfield(AllCombined,{i},'IK', IKArray);
                AllCombined=setfield(AllCombined,{i},'ID_BW', IDArray);
                AllCombined=setfield(AllCombined,{i},'GRF_BW', GRFArray);
                AllCombined=setfield(AllCombined,{i},'MF_BW', MFArray);
                AllCombined=setfield(AllCombined,{i},'FLEX', FlexArray);
                AllCombined=setfield(AllCombined,{i},'Power', PowerArray);
                AllCombined=setfield(AllCombined,{i},'Work', WorkArray);
                AllCombined=setfield(AllCombined,{i},'AngVel', AngVelArray);
                AllCombined=setfield(AllCombined,{i},'AngImp', AngImpArray);
                AllCombined=setfield(AllCombined,{i},'MaxIK', MaxIKArray);
                AllCombined=setfield(AllCombined,{i},'MaxID', MaxIDArray);
                AllCombined=setfield(AllCombined,{i},'MaxGRF', MaxGRFArray);
                AllCombined=setfield(AllCombined,{i},'MaxMF', MaxMFArray);
                AllCombined=setfield(AllCombined,{i},'MaxPower', MaxPowerArray);
                AllCombined=setfield(AllCombined,{i},'MaxAngVel', MaxAngVelArray);


                    end

                end

            cd ..\..\AVERAGES
            fieldNames = {'FE', 'IK', 'ID_BW', 'GRF_BW', 'MF_BW', 'FLEX', 'Power', 'Work','AngVel','AngImp', 'MaxIK', 'MaxID','MaxGRF','MaxMF', 'MaxPower', 'MaxAngVel'};

            for a=1:length(fieldNames)
        %         cd(DirTask);
                vars=AllCombined(1).(char(fieldNames(a))).Properties.VariableNames;
                for i = 1:size(AllCombined(1).(char(fieldNames(a))), 2)  %13, 24, 24, 13, 116
                    Temp=table();
                    for j = 1:length(trial)
                         Temp(:,j)= AllCombined(j).(char(fieldNames(a)))(:,i);

                    end  
                     Temp=table2array(Temp);
                     FieldAverage(:,i) = mean(Temp, 2);

                end

                FieldAverageTable=array2table(FieldAverage, 'VariableNames',vars);


                writetable(FieldAverageTable,[task_label{task} condStr fieldNames{a} '.xls']);

                clearvars FieldAverage FieldAverageTable;

            %     AllAverage=setfield(AllAverage,fieldNames(a),FieldAverage);
            end




            end
    

end

end


% 
% % FEInputsAverage=array2table(FEInputsAverage, 'VariableNames', VarNames);
% cd ..\..
% 
% writetable(FEInputsAverage, [task_label{task} condStr fieldNames{a} '.xls']);
% %  
%      

     