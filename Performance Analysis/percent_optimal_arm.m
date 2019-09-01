%% DESCRIPTION
% This function computes the percentage of time the optimal arm was picked
% as the game progressed
function percent_over_time=percent_optimal_arm(game_mat,bandit)
[ensembles,~,~]=size(game_mat);
% Replacing all the rewards with 1
times_played=game_mat;
times_played(times_played~=0)=1;
% Reorder 3-D matrix to get a collection of Ensemble*Arms matricies
times_played=permute(times_played,[1 3 2]);
% Adding up the ensembles
sum_ensemble=sum(times_played,1);
%Converting a [1*T*arms] matrix into a [T*arms] matrix

%Converting the sum into a matrix where each row is a time index and the
%columns tell us how many times each arm was played.
sum_ensemble=squeeze(sum_ensemble(1,:,:));
sum_ensemble=sum_ensemble';

%The best arm is the column of "sum_ensemble"; given by "bandit.best_arm"
percent_over_time=sum_ensemble(:,bandit.best_arm);
percent_over_time=percent_over_time/ensembles;
end