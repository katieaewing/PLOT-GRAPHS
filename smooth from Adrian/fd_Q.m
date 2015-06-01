function [dq,ddq]= fd_Q(q)
[dq]= fdCentral_Q(q);
[ddq]= fdCentral_Q(dq);

