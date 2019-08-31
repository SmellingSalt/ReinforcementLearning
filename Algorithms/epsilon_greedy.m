%% SETTING THE VARIABLES
function [choice]=epsilon_greedy(game_history)
[iteration,arms]=size(game_history);
epsilon=0.05;
% Setting parameters as per the paper
chance_of_other_arms=epsilon/arms;
chance_of_best_arm=1-epsilon+epsilon/arms;
% Ignoring the times we didn't get any rewards
rewards=game_history;
rewards(rewards==-1)=0;
%% ESTIMATING MEANS AND BEST ARM
estimates_of_average_reward=sum(rewards,1)/iteration;
if estimates_of_average_reward==0
    best_arm=randi(arms,1);
else
    estimates_of_average_reward=sum(rewards,1)/iteration;
    [~,best_arm]=max(estimates_of_average_reward);
end
%% CHOOSING AN ARM
if rand<chance_of_best_arm
    choice=best_arm;
else
    [~,choice]=min(estimates_of_average_reward);
    while(choice==best_arm&& arms>2)
        choice=randi((arms-1),1);
    end
    
end
end