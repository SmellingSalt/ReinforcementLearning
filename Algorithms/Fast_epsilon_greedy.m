%% SETTING THE VARIABLES
function [choice]=Fast_epsilon_greedy(history)
ensemble=history.ensemble;
arms=history.arms;
epsilon=0.05;
% Setting parameters as per the paper
chance_of_best_arm=1-epsilon;
reward_history=history.reward_history(ensemble,:);
arm_history=history.arm_history(ensemble,:);
%% ESTIMATING MEANS AND BEST ARM
estimates_of_average_reward=reward_history./arm_history;
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

end