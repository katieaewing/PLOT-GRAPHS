function [table] = setCond(brace, subjectID)

cd('C:\MyOpenSim4')

if brace == 1
    table=xlsread('subject_trials.xlsx', int2str(subjectID));
    condStr='_';
    braceCond='NO BRACE';
elseif brace == 2
    table=xlsread('subject_trials_brace.xlsx', int2str(subjectID));
    condStr='_Brace_';
    braceCond='BRACE';
end

end
