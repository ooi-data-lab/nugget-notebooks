% Theme 3 - Turbulent Mixing and Biophysical Interactions

% OOI Data Labs Education Nuggets (part of the NSF-funded OOI Synthesis & Education project)

% Written by Leslie Smith, Your Ocean Consulting, LLC

% Objective: Graph Wire-Following Profiler data from a csv file for the 
% "Turbulent Mixing from Extratropical Storm Hermine" data nugget 
% (https://datalab.marine.rutgers.edu/data-nuggets/extratropical-storm-hermine/). These 
% data can be downloaded from the nugget website, or generated from the 
% following Python notebook (https://github.com/ooi-data-lab/nugget-notebooks/blob/master/notebooks/Theme3_Hermine_PioneerArray.ipynb)

% Clear all variables and close all open matlab figures
clear all
close all
clc

%%   SELECT PROFILE DATASET TO RUN

INPUT = 'Theme3_Hermine_Pioneer_Upstream_Inshore_Profiler_Mooring.csv';
Figure_Title = 'Pioneer Upstream Inshore Profiler Mooring Data';                                   

%%   LOAD THE DATA AND ASSIGN VARIABLES

% Loads the data file in CSV format
INPUTData = importdata(INPUT, ',', 1);

% Assign variables from the columns in the datafile. Remember that you
% count text columns and data columns separate.
p = INPUTData.data(:,1);            % Pressure (dbar)
t = INPUTData.data(:,2);            % Temperature (C)

% Load in time and convert to Matlab time
time_text = INPUTData.textdata(:,1);
time_string = convertCharsToStrings(time_text);
time=datetime(time_string,'InputFormat','yyyy-MM-dd HH:mm:ss');
time(1,:)=[];


%% Make Colored Scatterplot

% Create the colored scatterplot and set the parameters of the graph
q=scatter3(time,p,0*p,12,t,'.'); % Temperature Plot
view([0 -90]); 
colormap('jet');
q.SizeData=350;
cbh=colorbar;
ylabel(cbh,'Temperature (C)');
grid('off');
ylabel('Pressure (dbar)')

% Set size of the plot
set(gcf,'position',[680 42 1000 300]);

% Add the title to the plot using the title you inputted in Line 21
title(Figure_Title,'fontsize', 16)

% If you want to manually tweak the color maps further see 'colormapeditor'