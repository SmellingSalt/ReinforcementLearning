function [choice]=Reinforce(history)
ensemble=history.ensemble;
arms=history.arms;
previous_arm=history.previous_arm;
reward_previous_arm=hisrtory.reward_previous_arm;
reward_history=history.reward_history(ensemble,:);
arm_history=history.arm_history(ensemble,:);
initial_mu_setting=1;
%% GET REWARDS AND FAILURES
expected_mu=reward_history./arm_history;
%If we have never played that arm, then the mean is set to 0 since
%expected_mu will be infinity;
if isinf(sum(expected_mu))
    expected_mu(isinf(expected_mu))=initial_mu_setting;
end


%% UPDATE RULE

probabilities=exp(expected_mu)./sum(exp(expected_mu));
if reward~=-1
    probabilities=probabilities+(1-expected_mu(previous_arm,1))
end
alpha
beta
choice=choose_arm_probability(probabilities);
end
