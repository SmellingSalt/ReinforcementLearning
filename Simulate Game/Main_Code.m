%% PLAYING THE GAME

%% SETTING VARIABLES
T=100;
repeat_game=10;
arms=10;
game_mat = zeros(repeat_game,T,arms);
%% GETTING BANDIT (SLOT) MACHINES
[bandit]= Game_settings(arms);

%% RUNNING THE GAME
algorithms=["Random", "Epsilon Greedy", "UCB" , "Thompson Sampling" ,"Reinforce", "Softmax"];
a=1;
choose_algortihm=algorithms(1,a);
for i=1:repeat_game
    for j=1:T
        % Choose arm c, given how many arms are there and the game progress
        % so far, along with which step we are in currently
        c=choose_arm(arms,game_mat(i,:,:),j,choose_algortihm);
        reward=Sim_game_Bernouli(c,bandit);
        % Store the reward in the matrix
        game_mat(i,j,c)=reward;
    end
end
%% VIEW A SAMPLE GAME
%view_a_game=squeeze(game_mat(1,:,:));

%% PERFORMANCE ANALYSIS
% regret per turn (1000 turns)
best_reward=bandit.mu_star*T;
for 
%assign to regret and turn in main program

rewards=game_mat(game_mat~=-1);
regret= 0.001*randi(100,1,1000);
turn = 1:1:1000;
plot(turn,regret);
subplot(1,1,1);
title('Regret per turn');
xlabel('number of turns');
ylabel('regret in that turn');

% percent of optimal arm played

optimal_arm_pulled_count = exp(randi(10,1,1000));
plot(turn,optimal_arm_pulled_count);
subplot(1,2,2);
title('%of optimal arm played');
xlabel('Total number of plays');
ylabel('Number of times optimal arm is pulled');
%