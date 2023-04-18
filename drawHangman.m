function drawHangman(lives)
hold on
title("Welcome to hangman Game!")
axis off;
switch lives
    case 6
        %-------- Rope -----------------
        Rope=line([2, 2], [5, 8], 'LineWidth', 6);
        Rope.Color='#A52A2A'; % brown color hex format
        %------- horizontal pool ------
        Hor_pool=line([2.5, -7], [8, 8], 'LineWidth', 13);
        Hor_pool.Color='#808080';
        %------- vertical pool -------
        ver_pool=line([-6.65, -6.65], [7, -25], 'LineWidth', 13);
        ver_pool.Color='#808080';
    case 5
        %--------- head -----------------
        p = nsidedpoly(50, 'Center', [2 3], 'Radius', 2);
        plot(p, 'FaceColor', 'r');
    case 4
        %---------- torso ----------------
        s1=line([2,2],[1,-5], 'LineWidth', 12);
        s1.Color='black';
    case 3
        %--------- Left hand -------------
        x_left_h=[2,-1];
        y_left_h=[0.3,-3];
        plot(x_left_h, y_left_h, 'LineWidth',9, 'Color','black');
    case 2
        %-------- Right hand ------------
        x_right_h=[2, 5];
        y_right_h=[0.3, -3];
        plot(x_right_h, y_right_h, 'LineWidth',9, 'Color','black');
    case 1
        %-------- Left leg --------------
        x_left_L=[-1, 2];
        y_left_L=[-10, -5];
        plot(x_left_L, y_left_L, 'LineWidth',9, 'Color','black');
    case 0
        %-------- Right leg ------------
        x_right_L=[2, 5];
        y_right_L=[-5, -10];
        plot(x_right_L, y_right_L, 'LineWidth',9, 'Color','black');
    otherwise
        fprintf("error from drawing-switch-case");
end 
hold off
end