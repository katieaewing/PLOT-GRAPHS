% ARCHIVE

function [VarsCombined VarsAverage] = averageVars(subjectID, task, trials, inputbrace)

task_label = {'SL30'; 'SL60'; 'SLND30'; 'SLND60'; 'DL30'; 'DL60'; 'SJ'};
inputbrace_label = {'NOBRACE'; 'BRACE'};

Dir=['C:\MyOpenSim4','\Subject_',int2str(subjectID)];



switch inputbrace
    
    case 1
        Dir=[Dir,'\NO BRACE'];
 
    case 2
        Dir=[Dir,'\BRACE'];;
       
end

VarsCombined=[];
VarNamesMax = {'GRF_BW', 'GRF_TIME', 'FLEX_MAX', 'HAMS_MED_MAX', 'HAMS_LAT_MAX', 'REC_FEM_MAX', 'VAS_MED_MAX','VAS_INT_MAX', 'VAS_LAT_MAX', 'GAS_MED_MAX', 'GAS_LAT_MAX', 'SOL_MAX'};
%set up structure

for i=1:length(trials)
    switch inputbrace
    
    case 1
        DirTask=[Dir '\' task_label{task} '_' int2str(trials(i))];
 
    case 2
        DirTask=[Dir '\' task_label{task} '_Brace_' int2str(trials(i))];
       
    end
    
    
    cd(DirTask);
    VarsArray=xlsread('MaxVars.xls');
    VarsCombined=setfield(VarsCombined,{i},'MaxVars',VarsArray);
end
 
for i = 1:size(VarsArray, 2)
     for j = 1:length(trials)
         Temp(:,j) = VarsCombined(j).MaxVars(:,i);
         
     end  
     
     VarsAverage(:,i) = mean(Temp, 2);
end

VarsAverage=array2table(VarsAverage, 'VariableNames', VarNamesMax);

cd ..

writetable(VarsAverage, [task_label{task} '_' inputbrace_label{inputbrace} '_MaxVars.xls']);
%  
     

     