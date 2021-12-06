clear all,close all,clc;
%% getfield
XID
state.ID=1
% state.right=2
% state.left=1
% state.up=1
% state.down=5
action='right'

'right'
'left'
'up'
'down'

state.action
getfield(state,action)
getfield(state,'right')
%% isequal
isequal(1,1)
1==1
isequal([1,1],[1,1])
[1,1]==[1,1]
isequal('right','right')


%% ID2RowCol
[row,col]=ID2RowCol(XID,IDno)
[row,col]=ID2RowCol(XID,7)

%% RowCol2ID
IDno=RowCol2ID(XID,row,col)
IDno=RowCol2ID(XID,2,3)

%% related_action_finder
% 'right' : 'right' 'up'    'down'
% 'left'  : 'left'  'up'    'down'
% 'up'    : 'up'    'right' 'left'
% 'down'  : 'down'  'right' 'left'
[related_action]=related_action_finder(action)
related_action{1}
related_action{2}
['right','left']
{'right','left'}
%% RRR
[reward_value] = RRR(state_ID,action,state_prime_ID,stateList)
RRR(4,'right',4,stateList)
RRR(8,'right',8,stateList)
%% s_prime_list_generator
s_prime_list=s_prime_list_generator(stateID,action,stateList)
s_prime_list_generator(1,'right',stateList)
s_prime_list_generator(2,'right',stateList)

%%
XID=1:12;
XID=reshape(XID,4,3);
XID=XID';


% state.ID=1
% state.location=[row,col]
% state.right=3
% state.left=3
% state.up=3
% state.down=3


% action='right';
% state.action
% getfield(state,action)

% [related_action]=related_action_finder(action)
% isequal(related_action{1},'up')
% isequal(related_action{2},'down')

stateList=[];
for ii=1:1:12
    state.ID=ii
%     [row,col]=ID2RowCol(XID,IDno)
    [row,col]=ID2RowCol(XID,ii)
    state.location=[row,col];
    stateList=[stateList,state];
end
%% defining the state-relations i.e. which states have connections b/w 'em
stateList(1).right=stateList(2)
stateList(1).up   =stateList(1)
stateList(1).left =stateList(1)
stateList(1).down =stateList(5)

stateList(2).right=stateList(3)
stateList(2).up   =stateList(2)
stateList(2).left =stateList(1)
stateList(2).down =stateList(2)

stateList(3).right=stateList(4)
stateList(3).up   =stateList(3)
stateList(3).left =stateList(2)
stateList(3).down =stateList(7)


stateList(4).right=stateList(4)
stateList(4).up   =stateList(4)
stateList(4).left =stateList(3)
stateList(4).down =stateList(8)

stateList(5).right=stateList(5)
stateList(5).up   =stateList(1)
stateList(5).left =stateList(5)
stateList(5).down =stateList(9)

stateList(6).right=stateList(1)     % it is a wall-state
stateList(6).up   =stateList(1)
stateList(6).left =stateList(1)
stateList(6).down =stateList(1)


stateList(7).right=stateList(8)
stateList(7).up   =stateList(3)
stateList(7).left =stateList(7)
stateList(7).down =stateList(11)

stateList(8).right=stateList(8)
stateList(8).up   =stateList(4)
stateList(8).left =stateList(7)
stateList(8).down =stateList(12)

stateList(9).right=stateList(10)
stateList(9).up   =stateList(5)
stateList(9).left =stateList(9)
stateList(9).down =stateList(9)

stateList(10).right=stateList(11)
stateList(10).up   =stateList(10)
stateList(10).left =stateList(9)
stateList(10).down =stateList(10)

stateList(11).right=stateList(12)
stateList(11).up   =stateList(7)
stateList(11).left =stateList(10)
stateList(11).down =stateList(11)

stateList(12).right=stateList(12)
stateList(12).up   =stateList(8)
stateList(12).left =stateList(11)
stateList(12).down =stateList(12)
%% it is working !!! Value-iteration algo.
transition_probability_list=[0.8,0.1,0.1];
V=zeros(100,12); % i=1,...,100
policy_in_state=zeros(100,12); % i=1,...,100
V(2,4)=+1;
V(2,8)=-1;
for ii=2:1:size(V,1)-1
    V(ii,4)=+1;      V(ii,8)=-1;
    V(ii+1,4)=+1;    V(ii+1,8)=-1;
    for s_index=1:1:12            % right-up-down      % left-up-down    % up-right-left    % down-right-left                          
        if s_index~=6 && s_index~=4 && s_index~=8
            term_1=0; % RIGHT
            s_prime_list=s_prime_list_generator(s_index,'right',stateList); 
            for  s_prime_index=1:1:3
                term_1=term_1+...
                    transition_probability_list(s_prime_index)*[0+0.9*V(ii,s_prime_list(s_prime_index))];
            end
            term_2=0; % LEFT
            s_prime_list=s_prime_list_generator(s_index,'left',stateList);
            for s_prime_index=1:1:3
                term_2=term_2+transition_probability_list(s_prime_index)*[0+0.9*V(ii,s_prime_list(s_prime_index))];
            end
            term_3=0; % UP
            s_prime_list=s_prime_list_generator(s_index,'up',stateList);
            for s_prime_index=1:1:3
                term_3=term_3+transition_probability_list(s_prime_index)*[0+0.9*V(ii,s_prime_list(s_prime_index))];
            end
            term_4=0; % DOWN
            s_prime_list=s_prime_list_generator(s_index,'down',stateList);
            for s_prime_index=1:1:3
                term_4=term_4+transition_probability_list(s_prime_index)*[0+0.9*V(ii,s_prime_list(s_prime_index))];
            end
            [MMM,III] = max([term_1,term_2,term_3,term_4]);
            V(ii+1,s_index)=MMM;
            action_no=III;
            policy_in_state(ii+1,s_index)=action_no;
        end
    end
end
% V
% reshape(V(end,:),4,3)'
%% Displaying the results
% map1 = [1    0     0      % red=lowest reward
%         0.75 0.25  0
%         0.50 0.50  0
%         0.25 0.75  0
%         0    1     0];    % green=highest reward
figure(1)
pause(1)
map1=[linspace(1,0,100)',flipud(linspace(1,0,100)'),zeros(100,1)];
for ii=1:1:30
    % imagesc(reshape(V(end-1,:),4,3)')
    imagesc(reshape(V(ii,:),4,3)')
    for jj=1:1:12
        temp_location=stateList(jj).location;
        temp_row=temp_location(1);
        temp_col=temp_location(2);
        temp_policy=policy_in_state(ii,jj);
        if jj~=4 & jj~=8 & jj~=6
            if temp_policy==1
                text(temp_col,temp_row,{num2str(V(ii,jj));'\rightarrow'},'FontSize',14);
            elseif temp_policy==2
                text(temp_col,temp_row,{num2str(V(ii,jj));'\leftarrow'},'FontSize',14);
            elseif temp_policy==3
                text(temp_col,temp_row,{num2str(V(ii,jj));'\uparrow'},'FontSize',14);
            else
                text(temp_col,temp_row,{num2str(V(ii,jj));'\downarrow'},'FontSize',14);
            end
        else
            text(temp_col,temp_row,{num2str(V(ii,jj));'\oslash'},'FontSize',14);
        end
    end
    title(['iter=',num2str(ii)],'FontSize',14);
    colormap(map1)
    colorbar
    pause(0.2);
    drawnow    
end

% reshape(policy_in_state(ii,:),4,3)'





%