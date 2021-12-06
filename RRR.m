% for f_003.m
function [reward_value] = RRR(state_ID,action,state_prime_ID,stateList)
% RRR function preparation
if state_ID==4 && state_prime_ID==4
    reward_value=1;
elseif state_ID==8 && state_prime_ID==8
    reward_value=-1;
else
    reward_value=0;
end
end







% for f_001.m
% function [reward_value] = RRR(state_ID,action,state_prime_ID,stateList)
% % RRR function preparation
% if state_ID==3 && state_prime_ID==3
%     reward_value=1;
% elseif state_ID==6 && state_prime_ID==6
%     reward_value=-1;
% else
%     reward_value=0;
% end
% end





