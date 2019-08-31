%% DESCRIPTION
% This function returns a reward based on the probability of winning, given
% a particular arm was chosen. Winning from an arm is bernouli distributed.
function [reward]=Sim_game_Bernouli(c,bandit)
if rand<bandit.prob_arm_win(c,1)
    % If rand< probability of win, then we have won the game. Return the
    % reward
    reward= bandit.arm_reward(c,1);
else
    %Return -1 if nothing was won
    reward = -1;
end
end