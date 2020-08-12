% Extra Nugget Argentine buoy dragged under by eddy 

% OOI Data Labs Education Nuggets (part of the NSF-funded OOI Synthesis & Education project)

% Written by Leslie Smith, Your Ocean Consulting, LLC

% Objective: Graph Wire-Following Profiler data from a csv file for the 
% "Argentine Buoy Eddy Encounter" data nugget 
% https://datalab.marine.rutgers.edu/data-nuggets/argentine-buoy-eddy-encounter/). These 
% data can be downloaded from the nugget website, or generated from the 
% following Python notebook (https://github.com/ooi-data-lab/nugget-notebooks/blob/master/extras/E02_Argentine_Basin_strong_currents.ipynb)

% Clear all variables and close all open matlab figures
clear all
close all
clc

%%   DATASET INFORMATION

INPUTA = 'E02_Argentine_Basin_FLMA_ADCP.csv';
Figure_TitleA = 'Argentine Basin Array Flanking Mooring A ADCP Data';

INPUTB = 'E02_Argentine_Basin_FLMB_ADCP.csv';
Figure_TitleB = 'Argentine Basin Array Flanking Mooring B ADCP Data';                                

%%   LOAD THE DATA AND ASSIGN VARIABLES

% Loads the data file in CSV format
FLMAData = importdata(INPUTA, ',', 1);
FLMBData = importdata(INPUTB, ',', 1);

% Assign variables from the columns in the datafile. Remember that you
% count text columns and data columns separate.
depthA = FLMAData.data(:,1);        % FLMA Depth (m)
velocityA = FLMAData.data(:,2);     % FLMA Eastward Seawater Velocity (m s-1)

depthB = FLMBData.data(:,1);        % FLMB Depth (m)
velocityB = FLMBData.data(:,2);     % FLMB Eastward Seawater Velocity (m s-1)


% Load in time and convert to Matlab time
time_textA = FLMAData.textdata(:,1);
time_stringA = convertCharsToStrings(time_textA);
timeA=datetime(time_stringA,'InputFormat','yyyy-MM-dd HH:mm:ss');
timeA(1,:)=[];

time_textB = FLMBData.textdata(:,1);
time_stringB = convertCharsToStrings(time_textB);
timeB=datetime(time_stringB,'InputFormat','yyyy-MM-dd HH:mm:ss');
timeB(1,:)=[];

%% Make Colored Scatterplots

% Colored Scatterplots
s1 = subplot(2,1,1)
  scatter3(timeA,depthA,0*depthA,12,velocityA,'.');
  view([0 -90]);
  Colors=brewermap(100,'*RdBu');
  % Note the brewermap function calls up a ColorBrewer colormap. To download
  % these color schemes go to https://github.com/DrosteEffect/BrewerMap
  colormap(Colors);
  caxis([-1.25 1.2]);
  cbh=colorbar;
  ylabel(cbh,'Eastward Seawater Velocity (m s-1)');
  set(gca,'fontsize',8);
  grid('off');
  ylabel('Depth (m)')
  
s2 = subplot(2,1,2)
  scatter3(timeB,depthB,0*depthB,12,velocityB,'.');
  view([0 -90]);
  cbh=colorbar;
  ylabel(cbh,'Eastward Seawater Velocity (m s-1)');
  set(gca,'fontsize',8);
  grid('off');
  ylabel('Depth (m)')
 
% Set size of the plot
set(gcf,'position',[680 42 1045 954]);

% Add the title to the first plot using the title you inputted in Line 18
title(s1,Figure_TitleA,'fontsize', 16)
title(s2,Figure_TitleB,'fontsize', 16)

% If you want to manually tweak the color maps further see 'colormapeditor'