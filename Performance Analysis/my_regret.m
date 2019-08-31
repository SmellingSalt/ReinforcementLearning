%% DESCRIPTION
% This function computes the regret given the optimal arms and a simulate
% game matrix
function [r]=my_regret(game_mat,bandit)
[ensembles,T,~]=size(game_mat);
%Ignoring the times we got nothing
rewards=game_mat;
rewards(rewards==-1)=0;

% Adding up all the rewards in all the ensembles
final_reward=sum(rewards,1);
%Converting a 3D matrix to a 2D matrix
final_reward=squeeze(final_reward(1,:,:));

%Computing the average gains over all the ensembles
average_reward_per_instant=sum(final_reward,2)/ensembles;

r=zeros(T,1);
%Computing regret as time progresses, over all the ensembles
for i=1:T
    r(i,1)=bandit.mu_star*i*ensembles-sum(average_reward_per_instant(1:i));
end