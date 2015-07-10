%% Created by: Katie Ewing 
% Modified: June 2015
%
% This function averages the THREE trials from a given landing condition
% and saves them into a subject folder called AVERAGES.
%%
function averageTrials(subjectID, brace, myTable)

task_label = {'SL30'; 'SL60'; 'SLND30'; 'SLND60'; 'DL30'; 'DL60'; 'SJ'};

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

for task=[5 6]
%     1:length(myTable)
    trial=myTable(task, 2:4);
    
            if trial==0
                 task=task + 1;
            else

                for i=1:length(trial)

                    if trial(i) == 0  %for tasks with one or two good trials (not three)
                       break; %changed to break to make it work!!! Bah
                    else
                        

                switch brace

                    case 1
                        DirTask=[Dir '\' task_label{task} '_' int2str(trial(i)) '\TABLES'];

                    case 2
                        DirTask=[Dir '\' task_label{task} '_Brace_' int2str(trial(i)) '\TABLES'];

                end


                cd(DirTask);

%                 FEArray=readtable('FE_Model_Inputs.xls');
%                 IKArray=readtable('IKfinal.xls');
%                 IDArray=readtable('IDfinal_BW.xls');
%                 GRFArray=readtable('GRFfinal_BW.xls');
%                 MFArray=readtable('MFfinal_BW.xls');
%                 MFGroupArray=readtable('MF_BW_groups.xls');
%                 MAArray=readtable('MAfinal.xls');
%                 MuscleTorqueArray=readtable('MuscleTorque_BW.xls');
%                 MuscleTorqueHipArray=readtable('MuscleTorqueHip_BW.xls');
%                 MuscleTorqueAnkleArray=readtable('MuscleTorqueAnkle_BW.xls');
                 MuscleTorqueKneeGroupArray=readtable('muscleTorqueGroupsKnee.xls');
                 MuscleTorqueHipGroupArray=readtable('muscleTorqueGroupsHip.xls');
                 MuscleTorqueAnkleGroupArray=readtable('muscleTorqueGroupsAnkle.xls');
                  
%                 FlexArray=readtable('three_flexion_angles.xls');
%                 PowerArray=readtable('Power.xls');
%                 WorkArray=readtable('Work.xls');
%                 AngVelArray=readtable('AngVel.xls');
%                 AngImpArray=readtable('AngImp.xls');
%                                 
%                 FlexAtPeakGRFArray=readtable('FlexAtPeakGRF.xls');
%                 FlexAtICArray=readtable('FlexAtIC.xls');
%                 PercentWorkArray=readtable('PercentJointWork.xls');
                
                %also for maximums
%                 MaxIKArray=readtable('maxIK_mag_time.xls');
%                 MaxIDArray=readtable('maxID_BW_mag_time.xls');
%                 MaxGRFArray=readtable('maxGRF_BW_mag_time.xls');
%                 MaxMFArray=readtable('maxMF_BW_mag_time.xls');
%                 MaxMFGroupArray=readtable('maxMF_BW_groups_mag_time.xls');
%                 MaxPowerArray=readtable('maxPower_mag_time.xls');
%                 MaxAngVelArray=readtable('maxAngVel_mag_time.xls');
                 MaxMuscleTorqueKneeGroupArray=readtable('maxMuscleTorqueKnee_mag_time.xls');
                 MaxMuscleTorqueHipGroupArray=readtable('maxMuscleTorqueHip_mag_time.xls');
                 MaxMuscleTorqueAnkleGroupArray=readtable('maxMuscleTorqueAnkle_mag_time.xls');
%                 
%                 
% 
%                 AllCombined=setfield(AllCombined,{i},'FlexAtPeakGRF', FlexAtPeakGRFArray);
%                 AllCombined=setfield(AllCombined,{i},'FlexAtIC', FlexAtICArray);
%                 AllCombined=setfield(AllCombined,{i},'FE', FEArray);
%                 AllCombined=setfield(AllCombined,{i},'IK', IKArray);
%                 AllCombined=setfield(AllCombined,{i},'ID_BW', IDArray);
%                 AllCombined=setfield(AllCombined,{i},'GRF_BW', GRFArray);
%                 AllCombined=setfield(AllCombined,{i},'MF_BW', MFArray);
%                 AllCombined=setfield(AllCombined,{i},'MFGroup', MFGroupArray);
%                 AllCombined=setfield(AllCombined,{i},'MA', MAArray);
%                 AllCombined=setfield(AllCombined,{i},'MuscleTorque', MuscleTorqueArray);
%                  AllCombined=setfield(AllCombined,{i},'MuscleTorqueHip', MuscleTorqueHipArray);
%                  AllCombined=setfield(AllCombined,{i},'MuscleTorqueAnkle', MuscleTorqueAnkleArray);
%                     T=load('AllVariables.mat','AllRMSTorques');
%                     AllCombined=setfield(AllCombined,{i},'AllRMSTorques',T.AllRMSTorques );
                AllCombined=setfield(AllCombined,{i},'MuscleTorqueGroupKnee', MuscleTorqueKneeGroupArray);
                AllCombined=setfield(AllCombined,{i},'MuscleTorqueGroupHip', MuscleTorqueHipGroupArray);
                AllCombined=setfield(AllCombined,{i},'MuscleTorqueGroupAnkle', MuscleTorqueAnkleGroupArray);



%                 AllCombined=setfield(AllCombined,{i},'FLEX', FlexArray);
%                 AllCombined=setfield(AllCombined,{i},'Power', PowerArray);
%                 AllCombined=setfield(AllCombined,{i},'Work', WorkArray);
%                 AllCombined=setfield(AllCombined,{i},'AngVel', AngVelArray);
%                 AllCombined=setfield(AllCombined,{i},'AngImp', AngImpArray);
%                 AllCombined=setfield(AllCombined,{i},'MaxIK', MaxIKArray);
%                 AllCombined=setfield(AllCombined,{i},'MaxID', MaxIDArray);
%                 AllCombined=setfield(AllCombined,{i},'MaxGRF', MaxGRFArray);
%                 AllCombined=setfield(AllCombined,{i},'MaxMF', MaxMFArray);
%                 AllCombined=setfield(AllCombined,{i},'MaxMFGroup',MaxMFGroupArray);
%                 AllCombined=setfield(AllCombined,{i},'MaxPower', MaxPowerArray);
%                 AllCombined=setfield(AllCombined,{i},'MaxAngVel', MaxAngVelArray);
                AllCombined=setfield(AllCombined,{i},'MaxMuscleTorqueGroupKnee', MaxMuscleTorqueKneeGroupArray);
                AllCombined=setfield(AllCombined,{i},'MaxMuscleTorqueGroupHip', MaxMuscleTorqueHipGroupArray);
                AllCombined=setfield(AllCombined,{i},'MaxMuscleTorqueGroupAnkle', MaxMuscleTorqueAnkleGroupArray);
%                 AllCombined=setfield(AllCombined,{i},'PercentJointWork', PercentWorkArray);
                
            

                    end  %if trial(i) == 0  statement

                end  %trial loop
            end % if trial==0 statement


            cd ..\..\AVERAGES
%             fieldNames = {'FlexAtPeakGRF', 'FlexAtIC', 'FE', 'IK', 'ID_BW', 'GRF_BW', 'MF_BW', 'MFGroup', 'MA', 'MuscleTorque', 'MuscleTorqueHip', 'MuscleTorqueAnkle', 'AllRMSTorques', 'FLEX', 'Power', 'Work','AngVel','AngImp', 'MaxIK', 'MaxID','MaxGRF','MaxMF', 'MaxMFGroup', 'MaxPower', 'MaxAngVel', 'PercentJointWork'};
%             fieldNames = {'AllRMSTorques'};
%                 fieldNames = {'MuscleTorqueHip', 'MuscleTorqueAnkle'};
            fieldNames = {'MuscleTorqueGroupKnee', 'MuscleTorqueGroupHip', 'MuscleTorqueGroupAnkle', 'MaxMuscleTorqueGroupKnee','MaxMuscleTorqueGroupHip','MaxMuscleTorqueGroupAnkle'};

            for a=1:length(fieldNames)
        %         cd(DirTask);
                vars=AllCombined(1).(char(fieldNames(a))).Properties.VariableNames;
                for i = 1:size(AllCombined(1).(char(fieldNames(a))), 2)  %13, 24, 24, 13, 116
                    Temp=table();
                    for j = 1:length(trial)
                        if trial(j)~=0 %if only have one or two good trials, will have 0 in myTable
                            Temp(:,j)= AllCombined(j).(char(fieldNames(a)))(:,i);                                               
                        else
                            break
                           
                        end

                    end  
                     Temp=table2array(Temp);
                     FieldAverage(:,i) = mean(Temp, 2);

                end

                FieldAverageTable=array2table(FieldAverage, 'VariableNames',vars);

                writetable(FieldAverageTable,[task_label{task} condStr fieldNames{a} '.xls']);

                clearvars FieldAverage FieldAverageTable;

            end

end
    

end
     