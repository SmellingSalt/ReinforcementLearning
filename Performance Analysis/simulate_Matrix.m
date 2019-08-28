
Trials=1000;        %% Trials=input('enter # of trials');  How many times you want to play?
arms = 10;          %% arms=input('enter # of arms, select within [2,5,10,50]'); How many arms are available to draw? 
arm_reward=[10,50,20,5,30,40,70,15,25,80];      %% Reward fixed for each arm
prob_arm_win=[0.4,0.6,0.5,0.9,0.3,0.7,0.8,0.5,0.6,0.3];         %% Probability of winning for a selected arm
mat = zeros(Trials,arms);       %% Initialize the final matrix with #rows as Trails and #columns as arms available
for i=1:Trials
    space=zeros(1,arms);
    arm_selected=randi(arms,1,1);
    if(round(rand*10,0)>5)
        space(arm_selected)=arm_reward(arm_selected);
    else
        space(arm_selected)=-1;
    end
    mat(i,:) = space;
end
