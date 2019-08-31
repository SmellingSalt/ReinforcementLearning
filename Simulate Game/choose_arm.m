function [choice]=choose_arm(arms,game_history,algorithm_parameters)
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

