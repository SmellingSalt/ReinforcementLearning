function [choice]=choose_arm(arms,game_mat,iteration,algorithm_parameters)
game_history=squeeze(game_mat(1,1:iteration,:));
switch algorithm_parameters.choose_algortihm
    case "Random"
        choice=Random_algo(arms);
    case "Epsilon Greedy"
        choice=epsilon_greedy(game_history);
    case "UCB"
        %Function call to algorithm
    case "Thompson Sampling"
        %Function call to algorithm
    case "Reinforce"
        %Function call to algorithm
    case "Softmax"
        %Function call to algorithm
    otherwise
        error("Improper Algorithm Name")
end

