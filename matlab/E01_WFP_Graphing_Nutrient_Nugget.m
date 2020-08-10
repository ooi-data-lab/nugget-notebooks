% Extra Nugget "Nutrients" - CTD, CDOM and Nitrate data from Cabled Shallow Profilers

% OOI Data Labs Education Nuggets (part of the NSF-funded OOI Synthesis & Education project)

% Written by Leslie Smith, Your Ocean Consulting, LLC

% Objective: Graph Wire-Following Profiler data from csv files for the 
% "Nutrients in the Open Ocean – Water Column Profiles" data nugget 
% (https://datalab.marine.rutgers.edu/data-nuggets/nutrients/). These 
% data can be downloaded from the nugget website, or generated from the 
% following Python notebook (https://github.com/ooi-data-lab/nugget-notebooks/blob/master/extras/E01_Cabled_profiler_nutrients.ipynb)

% Clear all variables and close all open matlab figures
clear all
close all
clc

%%   SELECT PROFILE DATASET TO RUN

% Choose one of the following two stations, which ever one you do not want
% to run, comment out.

%INPUT = 'E01_RS01SBPS_Oregon_Slope_Base_profiler.csv';
%Figure_Title = 'Regional Cabled Array Oregon Slope Base Profiler Mooring Data';

INPUT = 'E01_RS03AXPS_Axial_Base_profiler.csv';
Figure_Title = 'Regional Cabled Array Axial Base Profiler Mooring Data';      
                                

%%   LOAD THE DATA AND ASSIGN VARIABLES

% Loads the data file in CSV format
INPUTData = importdata(INPUT, ',', 1);

% Assign variables from the columns in the datafile. Remember that you
% count text columns and data columns separate.
p = INPUTData.data(:,1);            % Pressure (dbar)
t = INPUTData.data(:,2);            % Temperature (C)
s = INPUTData.data(:,3);            % Practical Salinity
do = INPUTData.data(:,4);           % Dissolved Oxygen (umol kg-1)
c = INPUTData.data(:,5);            % CDOM (ppb)
n = INPUTData.data(:,6);            % Nitrate (umol L-1)

% Load in time and convert to Matlab time
time_text = INPUTData.textdata(:,1);
time_string = convertCharsToStrings(time_text);
time=datetime(time_string,'InputFormat','yyyy-MM-dd HH:mm:ss');
time(1,:)=[];


%% Make Colored Scatterplots

% Create the colored scatterplots and set the parameters of the graph
s1=subplot(5,1,1); % Temperature Plot
   q=scatter3(time,p,0*p,12,t,'.');
   view([0 -90]); 
   colormap(s1,'jet');
   caxis([6.9 19.6]);
   q.SizeData=100;
   cbh=colorbar;
   ylabel(cbh,'Temperature (C)');
s2=subplot(5,1,2); % Salinity Plot
   v=scatter3(time,p,0*p,12,s,'.');
   view([0 -90]);
   colormap(s2,'winter')
   caxis([30.9 34.1]);
   v.SizeData=100;
   cbh=colorbar;
   ylabel(cbh,'Salinity');
s3=subplot(5,1,3); % Dissolved Oxygen Plot
   w=scatter3(time,p,0*p,12,do,'.');
   view([0 -90]);
   colormap(s3,'bone')
   caxis([59.9 365.1]);
   w.SizeData=100;
   cbh=colorbar;
   ylabel(cbh,'Dissolved Oxygen (umol kg-1)');
s4=subplot(5,1,4); % CDOM Plot
   l=scatter3(time,p,0*p,12,c,'.');
   view([0 -90]);
   cmap = flipud(copper);
   colormap(s4,cmap);
   caxis([0.3 3]);
   l.SizeData=100;
   cbh=colorbar;
   ylabel(cbh,'CDOM (ppb)');
s5=subplot(5,1,5); % Nitrate
   w=scatter3(time,p,0*p,12,n,'.');
   view([0 -90]);
   colormap(s5,'parula')
   caxis([0.01 36.6]);
   w.SizeData=100;
   cbh=colorbar;
   ylabel(cbh,'Nitrate (umol L-1)');
   
% Standardize settings across all plots
for ax=[s1,s2,s3,s4,s5]
    grid(ax,'off');
    set(ax,'fontsize',8);
    ylabel(ax,'Pressure (dbar)')
    xlim(ax, [datetime(2017,08,04), datetime(2017,12,08,18,0,0) ] );
end

% Set size of the plot
set(gcf,'position',[680 42 1045 954]);

% Add the title to the first plot using the title you inputted in Line 18
title(s1,Figure_Title,'fontsize', 16)

% If you want to manually tweak the color maps further see 'colormapeditor'