% Smooth any set of data with a cutoff
% Note: time vector must be the first row!
% 
% Tim Dorn
% 1/8/2006
% ---------------------------------------------------------
% Usage: smoothed = smooth_data(raw, cutoff)
% ---------------------------------------------------------

function smoothed = smooth_data(raw, cutoff)

t = raw(1,:);
SP = t(2) - t(1);

smoothed = smooth(raw', cutoff, 1/SP)';
smoothed(1,:) = t;

end
