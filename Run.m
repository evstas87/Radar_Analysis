%% Add All path for functions
clc
clear all
close all
cd('c:\Users\evsta\Documents\MATLAB\Radar_Analysis\')
NNL_path = cd;
Dir = dir(cd);

for dix = 3:length(Dir)
    addpath([NNL_path '\' Dir(dix).name]);
end

