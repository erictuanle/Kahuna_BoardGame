for i = 1:27
    pont = char(T_corrpont(i,2));
    pont=eval(pont);
    pont=pont.id;
    if (T_possesspont(pont,2)==0)
        set(handles(2+pont),'LineWidth',5,'Color',[0.5 0.5 0.5]) ;
    elseif (T_possesspont(pont,2)==1)
        set(handles(2+pont),'LineWidth',5,'Color',[1 1 1]) ;
    else
        set(handles(2+pont),'LineWidth',5,'Color',[0 0 0]) ;
    end
end