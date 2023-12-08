% LORENZ SYSTEM - sensitivity to initial conditions

clear all;
close all;
clc;

global sigma;
global rho;
global beta;

sigma = 10;
rho = 28;
beta = 8/3;
      
t = linspace (0, 50, 5001);

% 1st run
x0 = [0; 1; 1.05];
% x1 = lsode("flor", x0, t); 
[t x1] = ode45(@(t, x) flor(x, t), t, x0);

figure(1);
subplot(2, 3, 1);
plot(t, x1(:,1));
xlabel('t');
ylabel('X');
title('X - component');
hold on;

% figure(2);
subplot(2, 3, 2);
plot(t, x1(:,2));
xlabel('t');
ylabel('Y');
title('Y - component');
hold on;

% figure(3);
subplot(2, 3, 3);
plot(t, x1(:,3));
xlabel('t');
ylabel('Z');
title('Z - component');
hold on;


% 2nd run
x0 = [0; 1; 1.051];
[t x2] = ode45(@(t, x) flor(x, t), t, x0);

% figure(1);
subplot(2, 3, 1);
plot(t, x2(:,1));
legend('1st run', '2nd run');
hold off;

% figure(2);
subplot(2, 3, 2);
plot(t, x2(:,2));
legend('1st run', '2nd run');
hold off;

% figure(3);
subplot(2, 3, 3);
plot(t, x2(:,3));
legend('1st run', '2nd run');
hold off;

% figure(4);
subplot(2, 3, 4);
plot(t, x1(:,1) - x2(:,1), 'b', t, x1(:,2) - x2(:,2), 'r', t, x1(:,3) - x2(:,3), 'g');
xlabel('t');
ylabel('difference');
title('Evolution of difference');
legend('X1 - X2', 'Y1 - Y2', 'Z1 - Z2');

% figure(5);
subplot(2, 3, 5);
plot3(x1(:,1), x1(:,2), x1(:,3));
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Lorenz strange attractor - 1st run');
view(45,10);
grid on;

% figure(6);
subplot(2, 3, 6);
plot3(x2(:,1), x2(:,2), x2(:,3), 'r');
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Lorenz strange attractor - 2nd run');
view(45,10);
grid on;


 
