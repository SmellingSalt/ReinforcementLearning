function [choice]=choose_arm(arms,game_history,algorithm_parameters,highest_reward)
switch algorithm_parameters.choose_algortihm
    case "Random"
        choice=Random_algo(arms);
    case "Epsilon Greedy"
        choice=epsilon_greedy(game_history);
    case "UCB"
        choice=UCB(game_history,highest_reward);
    case "Thompson Sampling"
        %Function call to algorithm
    case "Reinforce"
        %Function call to algorithm
    case "Softmax"
        %Function call to algorithm
    otherwise
        error("Improper Algorithm Name")
end

