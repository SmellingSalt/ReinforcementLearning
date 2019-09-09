%% DESCRIPTION
% This function computes the percentage of time the optimal arm was picked
% as the game progressed
function percent_over_time=percent_optimal_arm(game_mat,bandit)
[ensembles,T,~]=size(game_mat);
percent_over_time=zeros(T,1);
for j=1:ensembles
    single_game=squeeze(game_mat(j,:,:));
    times_played=single_game;
    times_played(times_played~=0)=1;
    %cumulatively adding all the arms played uptil a time
    cumulative_sum=cumsum(times_played);
    %Number of times the best arm has been played
    best_arm_plays=cumulative_sum(:,bandit.best_arm);
    %Adding all the columns of cum_sum
    temp=sum(cumulative_sum,2);
    %The percent over time is the ratio of the two variables. The running
    %average of this over all ensembles is taken.
    % Using running average formula: U_(n+1)=U_n*[n/(n+1)] + (S_n)/(n+1)
    final_temp=best_arm_plays./temp; 
    
    percent_over_time=((percent_over_time*(j-1))/j)+final_temp/j;
end
tt=11;
% 
% % Replacing all the rewards with 1
% times_played=game_mat;
% times_played(times_played~=0)=1;
% % Reorder 3-D matrix to get a collection of Ensemble*Arms matricies
% times_played=permute(times_played,[1 3 2]);
% % Adding up the ensembles
% sum_ensemble=sum(times_played,1);
% %Converting a [1*T*arms] matrix into a [T*arms] matrix
% 
% %Converting the sum into a matrix where each row is a time index and the
% %columns tell us how many times each arm was played.
% sum_ensemble=squeeze(sum_ensemble(1,:,:));
% sum_ensemble=sum_ensemble';
% 
% %The best arm is the column of "sum_ensemble"; given by "bandit.best_arm"
% percent_over_time=sum_ensemble(:,bandit.best_arm);
% percent_over_time=percent_over_time/ensembles;
end