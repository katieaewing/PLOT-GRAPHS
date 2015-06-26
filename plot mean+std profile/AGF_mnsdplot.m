function [hd_Mean,hd_SD] = AGF_mnsdplot(inMean,inSD,varargin)
% Adrian Lai & Shanyuanye Guan on 2015.01.30.
% ------------------------------------------------------------------------ %
% Purpose:
%       Plot multiple mean curves with corresponding standard deviation 
%       areas (upper and lower bounds)
% 
% Input:
%    Required
%       inMean      -- (m,n)        -- rows = trials, columns = mean measurements
%       inSD        -- (m,n)        -- rows = trials, columns = stdev measurements
%    Optional
%       X           -- (1,n)        -- x-axis measurements
%       LineColor   -- lines (m,3)  -- mean line colors (RGB) 
%       PatchColor  -- lines (m,3)  -- stdev area colors (RGB)
%       PatchAlpha  -- (1,1)        -- stdev area opacity (0~1)
%
% Output:
%       hd_Mean     -- mean line handles
%       hd_SD       -- stdev area handles
% ------------------------------------------------------------------------ %

%% Parse Function Inputs
p = inputParser;
addRequired(p,'inMean',@isnumeric);
addRequired(p,'inSD',@isnumeric);

cfgRow = size(inMean,1);
cfgCol = size(inMean,2);

deftX = linspace(0,cfgCol,cfgCol);
addParameter(p,'X',deftX,@isnumeric);

deftY = linspace(0,cfgCol,cfgCol);
addParameter(p,'Y',deftY,@isnumeric);

deftColor_Mean = lines(cfgRow);
addParameter(p,'LineColor',deftColor_Mean,@isnumeric);

deftColor_SD = deftColor_Mean;
addParameter(p,'PatchColor',deftColor_SD,@isnumeric);

deftAlpha = 0.3;
addParameter(p,'PatchAlpha',deftAlpha,@isnumeric);

% Parse inputs
parse(p,inMean,inSD,varargin{:});
cfgX = p.Results.X;
cfgY = p.Results.Y;
cfgColor_Mean = p.Results.LineColor;
cfgColor_SD = p.Results.PatchColor;
cfgAlpha = p.Results.PatchAlpha;

% Plot
hold on;
for lcli = 1:cfgRow
    hd_Mean(lcli,1) = plot(cfgX,inMean(lcli,:),'color',cfgColor_Mean(lcli,:));
    hd_SD(lcli,1) = Sub_PlotSD(cfgX,inMean(lcli,:),inSD(lcli,:),cfgColor_SD(lcli,:),cfgAlpha);
end
hold off;

function outFill = Sub_PlotSD(inDataX,inMean,inSD,inColor,inAlpha)
% Input Format: inDataX,inMean,inSD -- (1,N)

lclUpper = inMean+abs(inSD);
lclLower = inMean-abs(inSD);
lclX = [inDataX,fliplr(inDataX)];
lclY = [lclUpper,fliplr(lclLower)];
outFill = fill(lclX,lclY,inColor,'FaceAlpha',inAlpha,'EdgeColor','none');