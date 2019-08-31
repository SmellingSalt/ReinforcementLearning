function [choice]=choose_arm(arms,game_mat,iteration,choose_algortihm)
game_history=game_mat(1,1:iteration,:);
switch choose_algortihm
    case "Random"
        choice=Random_algo(arms);
    case "Epsilon Greedy"
        %Function call to algorithm
    case "UCB"
        %Function call to algorithm
    case "Thompson Sampling"
        %Function call to algorithm
    case "Reinforce"
        %Function call to algorithm
    case "Softmax"
        %Function call to algorithm
end

