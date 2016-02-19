% Thrasyvoulos Karydis
% 13/02/2015
% (c) Massachusetts Institute of Technology 2015
% Permission granted for experimental and personal use;
% license for commercial sale available from MIT

%this file has outputs the features in a new file called 'filename_feat'

clear;
clc;

f = load('andreas_pain_2501');
%reminder Fs is 10 Hz for freq data

filename = strcat(f.filename,'_feat');
k = 1;

varNames = {'label', ...
            'alpha_LE' ,'alpha_LF' ,'alpha_RF'  ,'alpha_RE', ...
            'beta_LE'  ,'beta_LF'  ,'beta_RF'   ,'beta_RE' , ...
            'gamma_LE','gamma_LF','gamma_RF','gamma_RE', ...
            'delta_LE','delta_LF','delta_RF','delta_RE', ...
            'theta_LE','theta_LF','theta_RF','theta_RE' };
        
observations = [];
    
for t=1:size(f.alpha,1)
        
     if (~strcmp(f.label{t},'unknown'))
        response{k} = f.label{t};
        row = [f.alpha(t,1) ...
               f.alpha(t,2) ...
               f.alpha(t,3) ...
               f.alpha(t,4) ...
               f.beta(t,1) ...
               f.beta(t,2) ...
               f.beta(t,3) ...
               f.beta(t,4) ...
               f.gamma(t,1) ...
               f.gamma(t,2) ...
               f.gamma(t,3) ...
               f.gamma(t,4) ...
               f.delta(t,1) ...
               f.delta(t,2) ...
               f.delta(t,3) ...
               f.delta(t,4) ...
               f.theta(t,1) ...
               f.theta(t,2) ...
               f.theta(t,3) ...
               f.theta(t,4) ...
            ];
        
        observations = [observations ; row];
        k = k+1;
     end
end

observations = zscore(observations);

featuresold = [cell2table(response') array2table(observations)];
featuresold.Properties.VariableNames = varNames;

observations = [];
    
for t=1:size(f.alpha,1)
        response{t} = f.label{t};
        row = [f.alpha(t,1) ...
               f.alpha(t,2) ...
               f.alpha(t,3) ...
               f.alpha(t,4) ...
               f.beta(t,1) ...
               f.beta(t,2) ...
               f.beta(t,3) ...
               f.beta(t,4) ...
               f.gamma(t,1) ...
               f.gamma(t,2) ...
               f.gamma(t,3) ...
               f.gamma(t,4) ...
               f.delta(t,1) ...
               f.delta(t,2) ...
               f.delta(t,3) ...
               f.delta(t,4) ...
               f.theta(t,1) ...
               f.theta(t,2) ...
               f.theta(t,3) ...
               f.theta(t,4) ];
        
    observations = [observations ; row];
      
end
observations = zscore(observations);

featuresnew = [cell2table(response') array2table(observations)];
featuresnew.Properties.VariableNames = varNames;
save(filename,'featuresold','featuresnew');
