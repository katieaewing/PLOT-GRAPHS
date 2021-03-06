%% Created by: Katie Ewing 
% Modified: September 2015
% 
% This function calculates the range of motion of the lower-extremity joints.
% Also gets total time in seconds.

%%

function [ROM] = getROM(FlexAtIC, IKfinal_max2, KneeJoint, EndTime, IniTime)

FlexTable=table2array(FlexAtIC);
FlexMax=table2array(IKfinal_max2);

HipIndex=KneeJoint{1}-3;
AnkleIndex=KneeJoint{1}+1;

HipFlexROM=FlexMax(HipIndex)-FlexTable(HipIndex);
KneeFlexROM=FlexMax(KneeJoint{1})-abs(FlexTable(KneeJoint{1}));
AnkleFlexROM=FlexMax(AnkleIndex)-FlexTable(AnkleIndex);

TotalTime=EndTime-IniTime;

ROM=[HipFlexROM KneeFlexROM AnkleFlexROM TotalTime];
ROM=array2table(ROM,'VariableNames',{'HipROM' 'KneeROM' 'AnkleROM' 'TotalTime'});

end

