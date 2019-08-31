%% DESCRIPTION
% This function computes the percentage of time the optimal arm was picked
% as the game progressed
function percent_over_time=percent_optimal_arm(game_mat,bandit)
[~,T,~]=size(game_mat);
% Replacing all the rewards with 1
times_played=game_mat;
times_played(times_played~=0)=1;
% Adding up the ensembles
sum_ensemble=sum(times_played,1);
%Converting a [1*T*arms] matrix into a [T*arms] matrix
sum_ensemble=squeeze(sum_ensemble(1,:,:));
%Creating a vector to store the percentage of times the optimal arm was chosen
percent_over_time=zeros(T,1);
for i=1:T
    %Summing up all the plays till time step i
    plays_till_now=sum(sum_ensemble(1:i,:),1);
    %Adding up all the games played
    total_plays=sum(plays_till_now);
    % Dividing the number of times the optimal arm was picked by
    % total_plays
    percent_over_time(i,1)=plays_till_now(1,bandit.best_arm)/total_plays;
end
end