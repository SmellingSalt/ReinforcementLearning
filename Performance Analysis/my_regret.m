%% DESCRIPTION
% This function computes the regret given the optimal arms and a simulate
% game matrix
function [regret]=my_regret(game_mat,bandit)
%% NUMBER OF TIME EACH ARM WAS PICKED AT AN INSTANT OF TIME
[ensembles,T,~]=size(game_mat);
times_played=game_mat;
times_played(times_played~=0)=1;
regret=zeros(T,1);
% %Computing regret as time progresses, over all the ensembles
% for i=1:T
%     times_each_arm_played=sum(times_played(:,1:i,:),2);
%     %The above line creates an Ensemble*Arms matrix where each element
%     %holds the number of times each arm was played for a particular
%     %ensemble, up until time step i.
%     delta=bandit.mu_star-bandit.mu;
%     %Delta is the difference of each arm's actual mean with the optimal
%     %mean
%     h=squeeze(times_each_arm_played(:,1,:));
%     %h is a 2D matrix holding the number of times each arm was pulled every
%     %ensemble.
%     regret(:,i)=(h*delta)';
% end

%Computing regret as time progresses, over all the ensembles
regret=zeros(T,1);
for j=1:ensembles
    %Getting the jth ensemble's game history
    regret_mat=squeeze(game_mat(j,:,:));
    % Finding out how many times each arm was played as time goes on
    times_played=regret_mat;
    times_played(times_played~=0)=1;
    % Finding the distance of mu_star with the other mu's
    delta=bandit.mu_star-bandit.mu;
    %adding up the times eah arm was played until each time
    cumulative_sum=cumsum(times_played)*delta;
    % Using running average formula: U_(n+1)=U_n*[(n+1)/N] + (S_n)/N
    regret=(regret*(j-1))/j+cumulative_sum/j;
end
end