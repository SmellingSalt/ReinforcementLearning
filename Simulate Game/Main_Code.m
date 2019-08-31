%% PLAYING THE GAME

%% SETTING VARIABLES
T=10000;
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
view_a_game=squeeze(game_mat(1,:,:));
