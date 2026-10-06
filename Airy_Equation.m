% Plots the Airy Equation solutions

clear
close all

M = [1/(3^(2/3)*gamma(2/3)) -1/(3^(1/3)*gamma(1/3)); 1/(3^(1/6)*gamma(2/3)) 3^(1/6)/gamma(1/3)];

x = -10:0.01:10;
N = 30;

Ai = airy(0, x);
Bi = airy(2, x);

a_i = 1;
b_i = 1;

y1 = a_i + 0 * x;
y2 = b_i * x;

f = figure;
c = uicontrol('String', 'Next', 'Callback', 'uiresume(f)');

for i = 0:N
    subplot(1, 2, 1); plot(x, Ai); grid; xlabel('x', fontsize = 12);
    ylim([-1 1]); xlim([x(1) x(end)])

    if i == 0
        legend('Airy Function - Ai(x)', fontsize = 12)
    else
        hold on

        plot(x, M(1, 1) * y1 + M(1, 2) * y2); ylim([-1 1])
        legend('Airy Function - Ai(x)', ['\alpha_1 y_1(x) + \beta_1 y_2(x)  [' num2str(i) ' terms]'], fontsize = 12)

        hold off
    end

    subplot(1, 2, 2); plot(x, Bi); grid; xlabel('x', fontsize = 12);
    ylim([-1 1]); xlim([x(1) x(end)])

    if i == 0
        legend('Airy Function - Bi(x)', fontsize = 12)
    else
        hold on

        plot (x, M(2, 1) * y1 + M(2, 2) * y2); ylim([-1 1])
        legend('Airy Function - Bi(x)', ['\alpha_2 y_1(x) + \beta_2 y_2(x)  [' num2str(i) ' terms]'], fontsize = 12)

        a_i = a_i / ((3 * i) * (3 * i - 1)); 
        y1 = y1 + a_i * x .^ (3 * i);

        b_i = b_i / ((3 * i + 1) * (3 * i));
        y2 = y2 + b_i * x .^ (3 * i + 1);

        hold off
    end

    sgtitle('Airy Functions and Series Solutions of: y'''' - xy = 0', fontsize = 16)

    uiwait(f)

end
