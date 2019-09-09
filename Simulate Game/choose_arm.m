function [choice,algorithm_parameters]=choose_arm(arms,game_history,algorithm_parameters,history)



switch algorithm_parameters.choose_algortihm
    case "Random"
        choice=Random_algo(arms);
    case "Epsilon Greedy"
               choice=epsilon_greedy(game_history);
%         choice=Fast_epsilon_greedy(history);
    case "UCB"
        choice=UCB(game_history);
    case "Thompson Sampling"
        choice=Thompson(game_history);
    case "Reinforce"
        %Function call to algorithm
    case "Softmax"
        choice=softmax(game_history);
    otherwise
        error("Improper Algorithm Name")
end

