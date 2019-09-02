%% SETTING THE VARIABLES
function [choice]=softmax(game_history)
%% PARAMETERS
temperature=0.25;
%% GAME HISTORY
[iteration,arms]=size(game_history);
%Counting the number of pulls for every arm so far
times_played=game_history;
times_played(times_played~=0)=1;
times_played=sum(times_played);
%Accumulating rewards of all the arms so far
rewards=game_history;
rewards(rewards==-1)=0;

%% ESTIMATING AVERAGE REWARDS
%% PLAYING EACH ARM AT LEAST ONCE
if iteration<=arms
    choice=iteration;
    return
end
total_rewards_for_each_arm=sum(rewards);
estimated_means=total_rewards_for_each_arm./times_played;
%All values NaN are set to 0
estimated_means(isnan(estimated_means))=0;
%% CHOICE OF THE ARM
softmax_probability=exp(estimated_means/temperature)/sum(exp(estimated_means/temperature));
[choice]=choose_arm_probability(softmax_probability);
if iteration==200
    testing=1;
end
end