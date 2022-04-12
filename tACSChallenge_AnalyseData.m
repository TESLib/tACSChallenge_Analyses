function [all_ps,all_bs] = tACSChallenge_AnalyseData(data_path, subjs, conditions)
%% script originally written by Benedikt Zoefel, CNRS Toulouse, in October 2021
%% modified in April 22

%% run this script with the following input argments:
%% - folder to your data, example: '../data/'
%% - subect initials to be analysed. The data for each subject must be in a separate folder that is labeled as such
%% (e.g., 'P01') and is located in the data folder. Example: {'P01, P02', P03'}
%% - condition labels to be analysed. Label must be part of the file name (including the stars in the example).
%% Example: {'*Montage A*','*Montage B*','*Montage C*'}

clc; close all;

addpath('./functions/');

all_ps = zeros(length(conditions),length(subjs));
all_bs = zeros(length(conditions),length(subjs));
all_hit_probs = zeros(8,length(conditions),length(subjs));

for s = 1:length(subjs)
    % load the data
    curr_data = tACSChallenge_SortData(data_path, subjs{s}, conditions);
    % and analyse it
    [all_ps(:,s), all_bs(:,s), all_hit_probs(:,:,s)] = tACSChallenge_EvalData(curr_data); 
end

all_hit_probs(9,:,:) = all_hit_probs(1,:,:); % duplicate first phase bin for visualisation

figure
plot(-pi:pi/4:pi,squeeze(mean(all_hit_probs,3)))
xlabel('tACS phase'); ylabel('detection probability'); legend(conditions);

figure
bar(mean(all_bs,2))
xlabel('conditions'); xticklabels(conditions); ylabel('modulation strength');
