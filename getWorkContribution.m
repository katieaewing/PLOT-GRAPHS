function [PercentJointWork] = getWorkContribution(Work,subjectID)

leg = {'right'; 'right'; 'right' ; 'right'; 'right'; 'left' ; 'right'  ; 'right' ; 'left' ; 'right' ; 'right'  ; 'right' ; 'right' ; 'right' ; 'right'};
whichLeg = char(leg(subjectID));

% Work of hip, knee, ankle


switch whichLeg
    
    case 'right'
        TotalWork = Work.hip_flexion_r + Work.knee_angle_r + Work.ankle_angle_r;
        PercentHipWork = (Work.hip_flexion_r/TotalWork)*100;
        PercentKneeWork = (Work.knee_angle_r/TotalWork)*100;
        PercentAnkleWork = (Work.ankle_angle_r/TotalWork)*100;
        
    case 'left'
        TotalWork = Work.hip_flexion_l + Work.knee_angle_l + Work.ankle_angle_l;
        PercentHipWork = (Work.hip_flexion_l/TotalWork)*100;
        PercentKneeWork = (Work.knee_angle_l/TotalWork)*100;
        PercentAnkleWork = (Work.ankle_angle_l/TotalWork)*100;
               
end

PercentJointWork=[PercentHipWork, PercentKneeWork, PercentAnkleWork];
PercentJointWork=array2table(PercentJointWork,'VariableNames',{'PercentHipWork' 'PercentKneeWork' 'PercentAnkleWork'});
writetable(PercentJointWork, 'PercentJointWork.xls');


end



