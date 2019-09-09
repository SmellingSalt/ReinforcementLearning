%% DESCRIPTION
%This function sets up the bandit arms and returns a structure, bandit,
%which has the following variables:
% bandit.arm_reward= The reward of each arm
% bandit.prob_arm_win= The probability of winning each arm
% bandit.mu_star= The highest expected reward amongst each arm
% bandit.best_arm=The best arm to pull to win on an average 
function [bandit]= Game_settings(k)
%% SETTING REWARD VALUES

if k==1
    error("Are you serious? 1 arm?")
end
arm_reward=zeros(k,1);
for i=1:k
    % Reward is a random integer 0 or 1
    arm_reward(i,1)=randi(2,1)-1;
end

%% SETTING REWARD PROBABILITIES
prob_arm_win=zeros(k,1);
for i=1:k
    % Probability of winning in each arm is a random number from 0-1
    prob_arm_win(i,1)=rand;
end

%% THE AVERAGE REWARD
mu=prob_arm_win.*arm_reward;
[mu_star, best_arm]=max(mu);
bandit.arm_reward=arm_reward;
bandit.prob_arm_win=prob_arm_win;
bandit.mu_star=mu_star;
bandit.best_arm=best_arm;
bandit.mu=mu;
end