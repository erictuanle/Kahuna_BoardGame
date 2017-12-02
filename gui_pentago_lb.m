function Pentago_LB()

StockLines();
InitializeBoard();


%**************************************************************************
function StockLines()
% Create a 3D matrix of winning line locations on the board

global lines;

lines = zeros(6,6,32);
cnt = 0;
% Horizontal lines:
for i = 1:6
   cnt = cnt+1;
   lines(i,1:5,cnt) = ones(1,5);
end
for i = 1:6
   cnt = cnt+1;
   lines(i,2:6,cnt) = ones(1,5);
end
% Vertical lines:
for i = 1:6
   cnt = cnt+1;
   lines(1:5,i,cnt) = ones(5,1);
end
for i = 1:6
   cnt = cnt+1;
   lines(2:6,i,cnt) = ones(5,1);
end
% Diagonal lines:
lines(1:5,1:5,25) = eye(5);
lines(2:6,2:6,26) = eye(5);
lines(1:5,2:6,27) = eye(5);
lines(2:6,1:5,28) = eye(5);
lines(1:5,1:5,29) = flipud(eye(5));
lines(2:6,2:6,30) = flipud(eye(5));
lines(1:5,2:6,31) = flipud(eye(5));
lines(2:6,1:5,32) = flipud(eye(5));
%**************************************************************************


%**************************************************************************
function InitializeBoard()
% Create the game board and graphics handles

global board
global handles

board = zeros(6,6);
handles(1) = figure;
set(handles(1),'Name','PENTAGO');
set(handles(1),'Toolbar','none');
screensize = get(0,'ScreenSize');
set(handles(1),'Position',[screensize(3)/2-300,screensize(4)/2-300,600,600]);
axis off;
axis square;
% Background:
handles(2) = patch([0 0 8 8],[0 -8 -8 0],[0.9 0.8 0.5]);
% Unoccupied spaces:
for i = 1:6
   for j = 1:6
       cnt = 2+(i-1)*6+j;
       r = 1/2; %radius of the circle
       a = i+r; %x-coordinate of the centre of the circle
       b = -j-r; %y-coordinate of the centre of the circle
       t = 0:2*pi/360:2*pi; %angle that the ray from (a,b) to (x,y) makes with the x-axis
       X = a+r*cos(t);
       Y = b+r*sin(t);
       handles(cnt) = patch(X,Y,[0.7 0.8 0.5]);
       set(handles(cnt),'ButtonDownFcn',{@CallbackPiece,j,i});
   end
end
EnablePieces('off');
% Vertical and horizontal lines:
handles(39) = line([4 4],[-1 -7],'LineWidth',2,'Color',[1 0 0]);
handles(40) = line([1 7],[-4 -4],'LineWidth',2,'Color',[1 0 0]);
% Arrows:
handles(41) = text(7.6,-1.5,'\rightarrow','HorizontalAlignment','center','FontSize',12,'FontWeight','bold','Rotation',-90);
handles(42) = text(6.5,-0.5,'\leftarrow','HorizontalAlignment','center','FontSize',12,'FontWeight','bold');
handles(43) = text(1.5,-0.5,'\rightarrow','HorizontalAlignment','center','FontSize',12,'FontWeight','bold');
handles(44) = text(0.6,-1.5,'\rightarrow','HorizontalAlignment','center','FontSize',12,'FontWeight','bold','Rotation',-90);
handles(45) = text(0.6,-6.5,'\leftarrow','HorizontalAlignment','center','FontSize',12,'FontWeight','bold','Rotation',-90);
handles(46) = text(1.5,-7.5,'\rightarrow','HorizontalAlignment','center','FontSize',12,'FontWeight','bold');
handles(47) = text(6.5,-7.5,'\leftarrow','HorizontalAlignment','center','FontSize',12,'FontWeight','bold');
handles(48) = text(7.6,-6.5,'\leftarrow','HorizontalAlignment','center','FontSize',12,'FontWeight','bold','Rotation',-90);
for i = 1:8
   set(handles(40+i),'ButtonDownFcn',{@CallbackArrow,i});
end
EnableArrows('off');
% Status text:
handles(49) = text(4,-8.5,'','HorizontalAlignment','center','FontSize',12,'FontWeight','bold');
CoinTossing();
Wait();
%**************************************************************************


%**************************************************************************
function Wait()
% Wait for events that occur after a move has been made

global board
global turn

win = TestForWin(board);
if (win==1) %somebody has won
   button = questdlg('Would you like to play again?','Game over','Yes','No','Yes');
   if (strcmp(button,'Yes'))
       InitializeBoard();
   else
       close all
   end
else
   if (turn==1)
       DisplayStatus('White''s turn');
   else
       DisplayStatus('Black''s turn');
   end
   EnablePieces('on');
end
%**************************************************************************


%**************************************************************************
function win = TestForWin(board)
% Test the board matrix for a winning line

global handles
global lines

win = 0;
white_win = 0;
black_win = 0;
% Check all the lines on the board:
for i = 1:32
   line_sum = sum(sum(lines(:,:,i).*board));
   if (line_sum==5)
       white_win = white_win+1;
   elseif (line_sum==-5)
       black_win = black_win+1;
   end
end
if (white_win==black_win)&&(white_win>0)
   DisplayStatus('Tie game');
   win = 1;
elseif (white_win>black_win)
   DisplayStatus('White wins');
   win = 1;
elseif (black_win>white_win)
   DisplayStatus('Black wins');
   win = 1;
end
if (win==0)&&(all(all(board~=0)))
   DisplayStatus('Draw game');
   win = 1;
end
if (win==1)
   % Flash the text:
   for i = 1:3
       pause(0.5);
       set(handles(49),'Color',[1 0 0]);
       pause(0.5);
       set(handles(49),'Color',[0 0 0]);
   end
end
%**************************************************************************


%**************************************************************************
function CallbackPiece(~,~,row,col)
% Update board matrix based on the click

global board
global turn

if (board(row,col)==0) %unoccupied spaces
   board(row,col) = turn;
   DrawBoard();
   EnablePieces('off');
   EnableArrows('on');
   ColorArrows('red');
   DisplayStatus('Rotate one of the sub-boards');
else
   DisplayStatus('This space is not available');
end
%**************************************************************************


%**************************************************************************
function CallbackArrow(~,~,arrow)
% Update board matrix based on the click

global board
global turn

board = RotateBoard(board,arrow);
DrawBoard();
EnableArrows('off');
ColorArrows('black');
turn =  -1*turn;
Wait();
%**************************************************************************


%**************************************************************************
function new_board = RotateBoard(board,arrow)
% Rotate one of the sub-boards by 90 degrees either clockwise or anti-clockwise (based on which arrow was selected)

new_board = board;
switch arrow
   case 1
       new_board(1:3,4:6) = rot90(board(1:3,4:6),-1);
   case 2
       new_board(1:3,4:6) = rot90(board(1:3,4:6));
   case 3
       new_board(1:3,1:3) = rot90(board(1:3,1:3),-1);
   case 4
       new_board(1:3,1:3) = rot90(board(1:3,1:3));
   case 5
       new_board(4:6,1:3) = rot90(board(4:6,1:3),-1);
   case 6
       new_board(4:6,1:3) = rot90(board(4:6,1:3));
   case 7
       new_board(4:6,4:6) = rot90(board(4:6,4:6),-1);
   case 8
       new_board(4:6,4:6) = rot90(board(4:6,4:6));
end
%**************************************************************************


%**************************************************************************
function DrawBoard()
% Draw the current game board

global handles
global board

colors = {[0 0 0],[0.7 0.8 0.5],[1 1 1]};
for i = 1:6
   for j = 1:6
       cnt = 2+(i-1)*6+j;
       set(handles(cnt),'FaceColor',colors{board(j,i)+2});
   end
end
%**************************************************************************


%**************************************************************************
function ColorArrows(str)
% Changes the color of the arrows on the game board

global handles

switch str
   case 'red'
       arrow_color = [1 0 0];
   case 'black'
       arrow_color = [0 0 0];
end
for i = 1:8
   set(handles(40+i),'Color',arrow_color);
end
%**************************************************************************


%**************************************************************************
function EnableArrows(str)
% Enable or disable the arrows

global handles

for i = 1:8
   set(handles(40+i),'HitTest',str);
end
%**************************************************************************


%**************************************************************************
function EnablePieces(str)
% Enable or disable the pieces

global handles

for i = 1:36
   set(handles(2+i),'HitTest',str);
end
%**************************************************************************


%**************************************************************************
function DisplayStatus(str)
% Update the status text at the bottom of the game board

global handles

set(handles(49),'String',str);
%**************************************************************************


%**************************************************************************
function CoinTossing()
% Use a coin toss to determine the first player

global turn

turn = randi([0 1],1);
if (turn==1)
   DisplayStatus('White goes first');
else
   turn = -1;
   DisplayStatus('Black goes first');
end
pause(1.0);
%**************************************************************************