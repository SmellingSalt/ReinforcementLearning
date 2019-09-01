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
r=zeros(T,1);
for i=1:T
    times_each_arm_played=sum(times_played(:,i,:),1);
    h=squeeze(times_each_arm_played(:,1,:))';
    %The above line creates an Ensemble*Arms matrix where each element
    %holds the number of times each arm was played for a particular
    %ensemble, up until time step i.
    delta=bandit.mu_star-bandit.mu;
    %Delta is the difference of each arm's actual mean with the optimal
    %mean

    %h is a 2D matrix holding the number of times each arm was pulled every
    %ensemble.
    average_times_played=h/ensembles;
    regret(i,1)=sum((average_times_played.*delta'));

    r(i,1)=sum(h);
end
rr=1;
end