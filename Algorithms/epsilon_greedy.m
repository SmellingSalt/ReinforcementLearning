%% SETTING THE VARIABLES
function [choice]=epsilon_greedy(game_history)
[iteration,arms]=size(game_history);
epsilon=0.05;
% Setting parameters as per the paper
chance_of_other_arms=epsilon/arms;
chance_of_best_arm=1-epsilon;
% Ignoring the times we didn't get any rewards
times_played=game_history;
times_played(times_played~=0)=1;

rewards=game_history;
rewards(rewards==-1)=0;
%% ESTIMATING MEANS AND BEST ARM
estimates_of_average_reward=sum(rewards,1)./sum(times_played,1);
%All values NaN are set to 0
estimates_of_average_reward(isnan(estimates_of_average_reward))=0;
if estimates_of_average_reward==0
    best_arm=randi(arms,1);
else
    [~,best_arm]=max(estimates_of_average_reward);
end
%% CHOOSING AN ARM
choice=best_arm;
%If rand is more than the chance of best arm, make another choice.
if rand>chance_of_best_arm
    %if there are 2 arms, the default choice will be the other arm (min)
    if arms==2
        [~,choice]=min(estimates_of_average_reward);
    else
    %Else, keep picking random arms that is not the best arm
    tic
        while(choice==best_arm)
            choice=randi((arms-1),1);
            if toc>3
                error("Infinite Loop?")
            end
        end
    end
    
end
if iteration<3
    choice=randi(arms,1);
end
if iteration==400
    gg=245;
end
end