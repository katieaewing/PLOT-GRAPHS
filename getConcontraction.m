
function [AngVel AngImp Power  Work] = getConcontraction(MF_BW_groups, IKfinal)

IKfinal=table2array(IKfinal);
totalTime=IKfinal(200,1)-IKfinal(1,1);
time=linspace(0,totalTime,200);
HAMS_area=trapz(time,MF_BW_groups.HAMS);
QUADS_area=trapz(time,MF_BW_groups.HAMS);

Overlap_area= trapz(time, min(max(MF_BW_groups.HAMS,0),max(MF_BW_groups.QUADS,0)))

max(MF_BW_groups.HAMS,0)
CI=(Overlap_area/(HAMS_area + QUADS_area))*100

plot(min(MF_BW_groups.HAMS, MF_BW_groups.QUADS))
hold on
plot( MF_BW_groups.QUADS)
