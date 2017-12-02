for (i=1:12)
    r = 21; %radius of the circle
    if (T_possessile(i,2)==1)
        ile=char(T_corrile(i,2));
        ile=eval(ile);
        a = ile.coordx; %x-coordinate of the centre of the circle
        b = ile.coordy; %y-coordinate of the centre of the circle
        t = 0:2*pi/360:2*pi; %angle that the ray from (a,b) to (x,y) makes with the x-axis
        X = a+r*cos(t);
        Y = b+r*sin(t);
        handles(38+i) = patch(X,Y,[1 1 1]);
        set(handles(38+i),'Visible','on')
    elseif (T_possessile(i,2)==2)
        ile=char(T_corrile(i,2));
        ile=eval(ile);
        a = ile.coordx; %x-coordinate of the centre of the circle
        b = ile.coordy; %y-coordinate of the centre of the circle
        t = 0:2*pi/360:2*pi; %angle that the ray from (a,b) to (x,y) makes with the x-axis
        X = a+r*cos(t);
        Y = b+r*sin(t);
        handles(38+i) = patch(X,Y,[0 0 0]);
        set(handles(38+i),'Visible','on')
    else
        set(handles(38+i),'Visible','off')
    end
end
clear ile