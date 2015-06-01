% smooth.m
% Smooth data using a 4th order lowpass.
% Usage: Y = smooth(data, cutOff, sampleFreq) 
% Only one cut off frequency provided
% Ajay Seth

function Y = smooth(data, Wc, sFreq)
maxF = sFreq/2;

wn = Wc/maxF;

smooth_input_Wc= Wc;
smooth_input_sFreq= sFreq;
smooth_input_2WcOversFreq_OrWn= wn;

[NF, Nc] = size(data);

[B, A] = butter(4, wn);
data = double(data);


for I = 1:Nc,
    y = filtfilt(B, A, data(:,I));
    Y(:,I) = y;			 				
end
