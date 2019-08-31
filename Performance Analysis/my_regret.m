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

times_played=game_mat;
times_played(times_played~=0)=1;

regret=zeros(ensembles,T);
%Computing regret as time progresses, over all the ensembles
for i=1:T
    if i==50
        g=90;
    end
    times_each_arm_played=sum(times_played(:,1:i,:),2);
    %The above line creates an Ensemble*Arms matrix where each element
    %holds the number of times each arm was played for a particular
    %ensemble, up until time step i.
    delta=bandit.mu_star-bandit.mu;
    %Delta is the difference of each arm's actual mean with the optimal
    %mean
    h=squeeze(times_each_arm_played(:,1,:));
    %h is a 2D matrix holding the number of times each arm was pulled every
    %ensemble.
    regret(:,i)=(h*delta)';
end
r=mean(regret);
g=10;