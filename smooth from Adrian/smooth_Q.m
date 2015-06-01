%=============================================================
   %function [Q,dQ,ddQ]=smooth_Q(Qx, cofreq, times)
   function [Q,dQ,ddQ]=smooth_Q(Qx, cofreq)
  
   %if nargin <3,
   %    times= linspace(Qx(1,1), Qx(1,end), 1000);
   %end
  
   %Qx= resamp3(Qx,times);
   Qx= double(Qx);
   
   Q(1,:)=Qx(1,:);
   
   if cofreq > 0,
      Q= smooth_data(Qx, cofreq );
   else
      Q= Qx;
   end
      
   if nargout > 1,
      [dQ,ddQ]= fd_Q(Q);
   end
 %=============================================================
