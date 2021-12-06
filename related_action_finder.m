function [related_action]=related_action_finder(action)

if isequal(action,'right') %action=='right'
    related_action_1='up';
    related_action_2='down';
elseif isequal(action,'up') %action=='up'
    related_action_1='right';
    related_action_2='left';
elseif isequal(action,'left') %action=='left'
    related_action_1='up';
    related_action_2='down';
elseif isequal(action,'down') %action=='down'
    related_action_1='right';
    related_action_2='left'; % 
else % this part is totally unnecessary
    related_action_1='right';
    related_action_2='left';
    disp('error');
end
% related_action=cell(2);
related_action{1}=related_action_1;
related_action{2}=related_action_2;

end


% right-up-down              
% up-right-left
% left-up-down
% down-right-left