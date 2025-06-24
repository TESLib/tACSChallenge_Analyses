run tACSChallenge_AnalyseData(data_path, subjs, conditions) to test whether perceptual outcomes are modulated by tACS phase

data_path: folder to your data. Example: '../data/'

subjs: Subect initials to be analysed. The data for each subject must be in a separate folder that is labeled as such (e.g., 'P01')
and is located in the main data folder (data_path). Needs to be in curly brackets. Example: {'P01, P02', P03'}

conditions: condition labels to be analysed. Label must be part of the file name (include the stars in the example if it is not the
complete file name). Needs to be in curly brackets. Example: {'*Montage A*','*Montage B*','*Montage C*'}

perm: number of permutations (typically 1000)


---------------------------------------------------------------

Example:
>> [all_ps,all_bs,all_hit_probs,all_bs_perm,all_pfs,group_level_p,group_level_comp,pf_p] = ...

tACSChallenge_AnalyseData('./LX/', {'LX_P01','LX_P02','LX_P03','LX_P04'}, {'*_A_*','*_B_*','*_C_*','*_Sh_*'},1000)

where X is the lab number assigned