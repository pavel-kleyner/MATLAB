% EA 1, Homework program assignment 3
%
% Name: Kleyner, Pavel
% Section: 23
% Date: 10/10/2015

%Initialize bust boolean determines if player or dealer has busted
play_bust_bool=0;
deal_bust_bool=0;

%Dealer's first two cards
dealer_total=0;

%First random card
a_deal=randi(13);
%Changes value of 11 to 13 (Face cards) to 10
if a_deal==11||a_deal==12||a_deal==13
    a_deal=10;
end

%Second random card
b_deal=randi(13);
%Changes value of 11 to 13 (Face cards) to 10
if b_deal==11||b_deal==12||b_deal==13
    b_deal=10;
end

dealer_total=dealer_total+a_deal+b_deal;
fprintf('The dealer shows %i, and hides the other card.\n',a_deal)

%Players's first two cards
player_total=0;

%First random card
a_play=randi(13);
%Changes value of 11 to 13 (Face cards) to 10
if a_play==11||a_play==12||a_play==13
    a_play=10;
end

%Second random card
b_play=randi(13);
%Changes value of 11 to 13 (Face cards) to 10
if b_play==11||b_play==12||b_play==13
    b_play=10;
end

player_total=player_total+a_play+b_play;

fprintf('You show %i and hide %i, totaling %i.\n',a_play,b_play,player_total)

%Player loop
while 1
    if player_total<=21
        hit_or_stand=input('Hit (1) or Stand (0)?\n');
    end
    %If hit, you add one more card
    if hit_or_stand==1
        new_play=randi(13);
        
        %Changes value of 11 to 13 (Face cards) to 10
        if new_play==11||new_play==12||new_play==13
            new_play=10;
        end
        player_total=player_total+new_play;
        fprintf('You drew a %i, totaling %i\n',new_play,player_total)
    %If stand, you exit the loop
    elseif hit_or_stand==0
        break 
    end
    if player_total>21
        play_bust_bool=1;
        fprintf('You bust!\nSorry, you lose.\n')
        return;
    end
end

%Dealer's loop
while dealer_total<21
    fprintf('The dealer has %i and %i, totaling %i\n',a_deal,b_deal,dealer_total)
    if dealer_total<17
        new_deal=randi(13);
        %Changes value of 11 to 13 (Face cards) to 10
        if new_deal==11||new_deal==12||new_deal==13
            new_deal=10;
        end
        dealer_total=dealer_total+new_deal;
        fprintf('The dealer draws a %i, totaling %i.\n',new_deal,dealer_total)
    end
    
    if dealer_total>21
        deal_bust_bool=1;
        fprintf('The dealer busts! \n You win! Hooray! \n')
        return;
    end
    
    if dealer_total>17 && dealer_total<21
        fprintf('The dealer stands:\n')
        break
    end
end

%No player or dealer bust
if play_bust_bool==0 && deal_bust_bool==0
    fprintf('The dealer has %i and you have %i.\n',dealer_total,player_total)
    %Dealer wins
    if dealer_total>player_total
        fprintf('The dealer wins!\n Sorry, you lose. \n')
    elseif dealer_total<player_total
        fprintf('You win!\n Hooray!\n')
    elseif dealer_total==player_total
        fprintf('You tied!\n')
    end
end
        
    
%Code outputs

%Player busts
% The dealer shows 9, and hides the other card.
% You show 3 and hide 4, totaling 7.
% Hit (1) or Stand (0)?
% 1
% You drew a 7, totaling 14
% Hit (1) or Stand (0)?
% 1
% You drew a 3, totaling 17
% Hit (1) or Stand (0)?
% 1
% You drew a 11, totaling 28
% You bust!
% Sorry, you lose.
    
%Player wins
% The dealer shows 10, and hides the other card.
% You show 4 and hide 5, totaling 9.
% Hit (1) or Stand (0)?
% 1
% You drew a 9, totaling 18
% Hit (1) or Stand (0)?
% 0
% The dealer has 10 and 2, totaling 12
% The dealer draws a 2, totaling 14.
% The dealer has 10 and 2, totaling 14
% The dealer draws a 10, totaling 24.
% The dealer busts! 
%  You win! Hooray!

%Player and dealer stand
% The dealer shows 10, and hides the other card.
% You show 2 and hide 9, totaling 11.
% Hit (1) or Stand (0)?
% 1
% You drew a 7, totaling 18
% Hit (1) or Stand (0)?
% 0
% The dealer has 10 and 10, totaling 20
% The dealer stands:
% The dealer has 20 and you have 18.
% The dealer wins!
%  Sorry, you lose. 