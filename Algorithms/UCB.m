function [choice]=UCB(game_history)
[iteration,arms]=size(game_history);

%% COUNTING THE NUMBER OF TIMES EACH ARM WAS PLAYED
times_played=game_history;
times_played(times_played~=0)=1;
%ai is a row vector holding the total number of times each arm has been
%played
ai=sum(times_played,1);

%% TOTAL REWARD
rewards=game_history;
rewards(rewards==-1)=0;

%% PLAYING EACH ARM AT LEAST ONCE
if iteration<=arms
    choice=iteration;
    return
end
%% ESTIMATING MEANS AND BEST ARM
estimates_of_average_reward=sum(rewards,1)./sum(times_played,1);
%All values NaN are set to 0
estimates_of_average_reward(isnan(estimates_of_average_reward))=0;
%% CREATING THE UCB BOUND REGIONS
%Creating the offset
ucb_offset_term=sqrt(2*log(iteration)./(ai));

estimates_of_average_reward=estimates_of_average_reward+ucb_offset_term;
[~,choice]=max(estimates_of_average_reward);
end