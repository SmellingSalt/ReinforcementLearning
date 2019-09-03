function [choice]=Thompson(game_history)
[iteration,arms]=size(game_history);
%% GET REWARDS AND FAILURES
positive_rewards=game_history;
positive_rewards(positive_rewards==-1)=0;
positive_rewards(positive_rewards~=0)=1;

negative_rewards=game_history;
negative_rewards(negative_rewards~=-1)=0;
negative_rewards=negative_rewards*(-1);

total_rewards=sum(positive_rewards,1);
total_busts=sum(negative_rewards,1);

expected_mu=zeros(arms,1);
initial_setting=1;
for i=1:arms
    %% UPDATE RULE
    alpha=initial_setting+total_rewards(1,i);
    beta=initial_setting+total_busts(1,i);
    expected_mu(i,1)=betarnd(alpha,beta);
end
[~,choice]=max(expected_mu);
if iteration==593
    gg=0;
end
end