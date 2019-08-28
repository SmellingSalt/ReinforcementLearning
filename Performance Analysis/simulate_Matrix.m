
n=input('enter # of trials');
arms=input('enter # of arms, select within [2,5,10]');
arm_reward=[10,50,20,5,30,40,70,15,25,80];
prob_arm_win=[0.4,0.6,0.5,0.9,0.3,0.7,0.8,0.5,0.6,0.3];
mat = zeros(n,arms);
for i=1:n
    space=zeros(1,arms);
    arm_selected=randi(arms,1,1);
    if(round(rand*10,0)>5)
        space(arm_selected)=arm_reward(arm_selected);
    else
        space(arm_selected)=-1;
    end
    mat(i,:) = space;
end
