%% s_prime_list_generator

function s_prime_list=s_prime_list_generator(stateID,action,stateList)


[related_action]=related_action_finder(action);
% stateList.related_action{1}
% getfield(stateList(2),'right').ID
% getfield(stateList(2),related_action{1}).ID
% getfield(stateList(2),related_action{2}).ID

s_prime_list=[getfield(stateList(stateID),action).ID,...
    getfield(stateList(stateID),related_action{1}).ID,...
    getfield(stateList(stateID),related_action{2}).ID];
end








