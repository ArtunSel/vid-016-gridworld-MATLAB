function [probability_value] = TTT(state_ID,action,state_prime_ID,stateList)
% TTT(state,action,state_prime,stateList)

related_action=related_action_finder(action);
related_action_1=related_action{1};
related_action_2=related_action{2};
% if stateList(state_prime_ID)==getfield(stateList(state_ID),action)
if isequal(state_prime_ID,getfield(stateList(state_ID),action).ID)
    probability_value=0.8;
elseif isequal(state_prime_ID,getfield(stateList(state_ID),related_action_1).ID)
    probability_value= 0.1;
elseif isequal(state_prime_ID,getfield(stateList(state_ID),related_action_2).ID)
    probability_value= 0.1;
else
    probability_value= 0;
end



end





% function [probability_value] = TTT(state_ID,action,state_prime_ID,stateList)
% % TTT(state,action,state_prime,stateList)
% 
% related_action=related_action_finder(action);
% related_action_1=related_action{1}
% related_action_2=related_action{2}
% if stateList(state_prime_ID)==stateList(state_ID).action
%     probability_value=0.8;
% elseif stateList(state_prime_ID)==stateList(state_ID).related_action_1
%     probability_value= 0.1;
% elseif stateList(state_prime_ID)==stateList(state_ID).related_action_2
%     probability_value= 0.1;
% else
%     probability_value= 0;
% end
% 
% 
% 
% end





% TTT(s1,a='right',s1)
% TTT(s1,a='right',s2)
% TTT(s1,a='right',s3)
% TTT(s1,a='right',s4)
% TTT(s1,a='right',s5)
% TTT(s1,a='right',s6)
% TTT(s1,a='right',s7)
% TTT(s1,a='right',s8)
% TTT(s1,a='right',s9)
% 
% TTT(s1,a='up',s1)
% TTT(s1,a='up',s2)
% TTT(s1,a='up',s3)
% TTT(s1,a='up',s4)
% TTT(s1,a='up',s5)
% TTT(s1,a='up',s6)
% TTT(s1,a='up',s7)
% TTT(s1,a='up',s8)
% TTT(s1,a='up',s9)
% 
% TTT(s1,a='left',s1)
% TTT(s1,a='left',s2)
% TTT(s1,a='left',s3)
% TTT(s1,a='left',s4)
% TTT(s1,a='left',s5)
% TTT(s1,a='left',s6)
% TTT(s1,a='left',s7)
% TTT(s1,a='left',s8)
% TTT(s1,a='left',s9)
% 
% TTT(s1,a='down',s1)
% TTT(s1,a='down',s2)
% TTT(s1,a='down',s3)
% TTT(s1,a='down',s4)
% TTT(s1,a='down',s5)
% TTT(s1,a='down',s6)
% TTT(s1,a='down',s7)
% TTT(s1,a='down',s8)
% TTT(s1,a='down',s9)