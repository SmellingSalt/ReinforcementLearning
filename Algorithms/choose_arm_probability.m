function [choice]=choose_arm_probability(probability)
%Sort the probabilities in ascending order and remember the original
%index(and thus the corresponding arm)
[probability,arm_index]=sort(probability);
%Pick a random number
play=rand;
%Cumulatively add the probabilities
cum_sum=cumsum(probability);
%Check where the random number chosen from 0-1 lies. 
i=2;
while play>cum_sum(1,(i-1))
    i=i+1;
end
%when the random number exceeds the probability, it lay in an interval
%before.
choice=arm_index(1,(i-1));
end