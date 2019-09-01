%% ADDING FOLDERS TO PATH
p1=genpath("Performance Analysis");
p2=genpath("Simulate Game");
p3=genpath("Algorithms");
addpath(p1);
addpath(p2);
addpath(p3);
new_game=1;
%% SETTING VARIABLES
algorithms=["Random", "Epsilon Greedy", "UCB" ,"Softmax", "Thompson Sampling" ,"Reinforce"];
legend_name=algorithms(1:3);
game_variance_threshold=1;

T=1000;
repeat_game=500;
arms=3;
for a=1:3
    %% GETTING BANDIT (SLOT) MACHINES
    game_mat = zeros(repeat_game,T,arms);
    tic
    if new_game==1
        [bandit]= Game_settings(arms);
        while var(bandit.mu/max(bandit.mu))>game_variance_threshold&&toc<3
            [bandit]= Game_settings(arms);
        end
    end
    new_game=0;
    
    %% RUNNING THE GAME
    choose_algortihm=algorithms(1,a);
    fprintf("Algorithm %s\n",choose_algortihm);
    algorithm_parameters.choose_algortihm=choose_algortihm;
    for i=1:repeat_game
        for j=1:T
            % Choose arm c, given how many arms are there and the game progress
            % so far, along with which step we are in currently
            
            game_history=squeeze(game_mat(1,1:j,:));
            if iscolumn(game_history)
                game_history=game_history';
            end
            %Using highest reward for normalisation in UCB
            highest_reward=max(bandit.arm_reward);
            c=choose_arm(arms,game_history,algorithm_parameters,highest_reward);
            reward=Sim_game_Bernouli(c,bandit);
            % Store the reward in the matrix
            game_mat(i,j,c)=reward;
        end
        fprintf("Running %s %d\n",algorithms(1,a),i)
        
    end
    %% PERFORMANCE ANALYSIS
    fprintf("Computing Regret\n")
    regret=my_regret(game_mat,bandit);
    fprintf("Computing Percentage of times the Optimal Arm was Picked\n")
    percent_over_time=percent_optimal_arm(game_mat,bandit);
    %% PLOT GRAPHS
    subplot(2,1,1)
    plot(1:T,regret);
    ylabel("Regret");
    xlabel("Rounds");
    
    title("Regret vs Rounds")
    legend(legend_name)
    grid minor
    hold on
    
    
    subplot(2,1,2)
    plot(1:T,percent_over_time*100);
    ylabel("Percentage %");
    ylim([0, 100])
    xlabel("Rounds");
    
    title("Percentage of Optimal Arm Plays vs Rounds")
    legend(algorithms)
    grid minor
    hold on
    
end
%% MINOR ADJUSTMENTS
subplot(2,1,1)
grid minor
subplot(2,1,2)
grid minor
d=squeeze(game_mat(6,:,:));
