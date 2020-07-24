% Theme 4 - Coastal Ocean Dynamics and Ecosystems, Shelf/Slope Exchange

% OOI Data Labs Education Nuggets (part of the NSF-funded OOI Synthesis & Education project)

% Written by Leslie Smith, Your Ocean Consulting, LLC

% Objective: Graph Wire-Following Profiler data from a csv file for the 
% "Warm-Core Ring Driven Shelf/Slope Exchange" data nugget 
% (https://datalab.marine.rutgers.edu/data-nuggets/warm-core-ring/). These 
% data can be downloaded from the nugget website, or generated from the 
% following Python notebook (https://github.com/ooi-data-lab/nugget-notebooks/blob/master/Theme4a_Pioneer_eddy.ipynb)

% Clear all variables and close all open matlab figures
clear all
close all
clc

%%   SELECT PROFILE DATASET TO RUN

% Choose one of the following two stations, which ever one you do not want
% to run, comment out.

%INPUT = 'Theme4a_CP04OSPM_Pioneer_Offshore_Profiler_Mooring.csv';
%Figure_Title = 'Pioneer Offshore Profiler Mooring Data';

INPUT = 'Theme4a_CP02PMCO_Pioneer_Central_Offshore_Profiler_Mooring.csv';
Figure_Title = 'Pioneer Central Offshore Profiler Mooring Data';                                   

%%   LOAD THE DATA AND ASSIGN VARIABLES

% Loads the data file in CSV format
INPUTData = importdata(INPUT, ',', 1);

% Assign variables from the columns in the datafile. Remember that you
% count text columns and data columns separate.
p = INPUTData.data(:,1);            % Pressure (dbar)
t = INPUTData.data(:,2);            % Temperature (C)
s = INPUTData.data(:,3);            % Practical Salinity
c = INPUTData.data(:,4);            % CDOM (ppb)
do = INPUTData.data(:,5);           % Dissolved Oxygen (umol kg-1)

% Load in time and convert to Matlab time
time_text = INPUTData.textdata(:,1);
time_string = convertCharsToStrings(time_text);
time=datetime(time_string,'InputFormat','yyyy-MM-dd HH:mm:ss');
time(1,:)=[];


%% Make Colored Scatterplots

% Create the colored scatterplots and set the parameters of the graph
s1=subplot(4,1,1); % Temperature Plot
   q=scatter3(time,p,0*p,12,t,'.');
   view([0 -90]); 
   colormap(s1,'jet');
   caxis([12 26]);
   q.SizeData=100;
   cbh=colorbar;
   ylabel(cbh,'Temperature (C)');
s2=subplot(4,1,2); % Salinity Plot
   v=scatter3(time,p,0*p,12,s,'.');
   view([0 -90]);
   colormap(s2,'winter')
   caxis([34.28 36.67]);
   v.SizeData=100;
   cbh=colorbar;
   ylabel(cbh,'Salinity');
s3=subplot(4,1,3); % CDOM Plot
   l=scatter3(time,p,0*p,12,c,'.');
   view([0 -90]);
   coppermap=[1 0.780392169952393 0.501960813999176;1 0.7739577293396 0.497646778821945;1 0.767523288726807 0.493332743644714;1 0.761088848114014 0.489018708467484;1 0.754654407501221 0.484704703092575;1 0.748219966888428 0.480390667915344;1 0.741785526275635 0.476076632738113;1 0.735351085662842 0.471762597560883;1 0.728916645050049 0.467448562383652;1 0.722482204437256 0.463134527206421;1 0.716047763824463 0.45882049202919;1 0.70961332321167 0.454506456851959;1 0.703178822994232 0.450192451477051;1 0.696744382381439 0.44587841629982;1 0.690309941768646 0.441564381122589;1 0.683875501155853 0.437250345945358;1 0.67744106054306 0.432936310768127;1 0.671006619930267 0.428622275590897;1 0.664572179317474 0.424308240413666;1 0.658137738704681 0.419994205236435;1 0.651703298091888 0.415680199861526;1 0.645268857479095 0.411366164684296;1 0.638834416866302 0.407052129507065;1 0.63239997625351 0.402738094329834;0.975000023841858 0.616589963436127 0.392669647932053;0.949999988079071 0.600779950618744 0.382601201534271;0.925000011920929 0.584969997406006 0.372532725334167;0.899999976158142 0.569159984588623 0.362464278936386;0.875 0.55334997177124 0.352395832538605;0.850000023841858 0.537539958953857 0.342327386140823;0.824999988079071 0.521730005741119 0.332258939743042;0.800000011920929 0.505919992923737 0.322190463542938;0.774999976158142 0.490109980106354 0.312122017145157;0.75 0.474299967288971 0.302053570747375;0.725000023841858 0.458489984273911 0.291985124349594;0.699999988079071 0.442679971456528 0.281916677951813;0.675000011920929 0.426869988441467 0.271848201751709;0.649999976158142 0.411059975624084 0.261779755353928;0.625 0.395249992609024 0.251711308956146;0.600000023841858 0.379439979791641 0.241642862558365;0.574999988079071 0.363629996776581 0.231574401259422;0.550000011920929 0.347819983959198 0.221505954861641;0.524999976158142 0.332010000944138 0.211437493562698;0.5 0.316199988126755 0.201369047164917;0.474999994039536 0.300389975309372 0.191300600767136;0.449999988079071 0.284579992294312 0.181232139468193;0.425000011920929 0.268769979476929 0.171163693070412;0.400000005960464 0.252959996461868 0.161095231771469;0.375 0.237149983644485 0.151026785373688;0.349999994039536 0.221339985728264 0.140958338975906;0.324999988079071 0.205529987812042 0.130889877676964;0.300000011920929 0.189719989895821 0.120821431279182;0.275000005960464 0.173909991979599 0.11075297743082;0.25 0.158099994063377 0.100684523582458;0.224999994039536 0.142289996147156 0.0906160697340965;0.200000002980232 0.126479998230934 0.0805476158857346;0.174999997019768 0.110669992864132 0.0704791694879532;0.150000005960464 0.0948599949479103 0.0604107156395912;0.125 0.0790499970316887 0.0503422617912292;0.100000001490116 0.0632399991154671 0.0402738079428673;0.0750000029802322 0.0474299974739552 0.0302053578197956;0.0500000007450581 0.0316199995577335 0.0201369039714336;0.025000000372529 0.0158099997788668 0.0100684519857168;0 0 0];
   colormap(s3,coppermap);
   caxis([0.09 2.75]);
   l.SizeData=100;
   cbh=colorbar;
   ylabel(cbh,'CDOM (ppb)');
s4=subplot(4,1,4); % Dissolved Oxygen Plot
   w=scatter3(time,p,0*p,12,do,'.');
   view([0 -90]);
   colormap(s4,'bone')
   caxis([128 264]);
   w.SizeData=100;
   cbh=colorbar;
   ylabel(cbh,'Dissolved Oxygen (umol kg-1)');
   
% Standardize settings across all plots
for ax=[s1,s2,s3,s4]
    grid(ax,'off');
    set(ax,'fontsize',8);
    ylabel(ax,'Pressure (dbar)')
    ylim(ax,[20 130]);
end

% Set size of the plot
set(gcf,'position',[680 42 1045 954]);

% Add the title to the first plot using the title you inputted in Line 18
title(s1,Figure_Title,'fontsize', 16)

% If you want to manually tweak the color maps further see 'colormapeditor'