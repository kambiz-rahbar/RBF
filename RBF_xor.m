clc
clear
close all

% XOR DATA
X = [0 1 0 1; 0 0 1 1];
T = [0 1 1 0];

% RBF Network
Spread = 0.55;
net = newrbe(X, T, Spread);

% Show the Results
step_size = 0.005;
[x1,x2] = meshgrid(min(X(:))-3*Spread:step_size:max(X(:))+3*Spread);
[m,n] = size(x1);

XX = [reshape(x1,1,[]); reshape(x2,1,[])];
Y = net(XX);
Y = reshape(Y,m,n);

decision_criteria = (max(Y(:)) - min(Y(:))) / 2; 
decision_boundary = (Y >= decision_criteria-step_size).*((Y <= decision_criteria+step_size));
decision_boundary = reshape(decision_boundary,m,n);

figure(1);
hold on;
contour(x1,x2,decision_boundary,'k','LineWidth',3)
plot(0,0,'rx','LineWidth',3,'MarkerSize',25);
plot(1,1,'rx','LineWidth',3,'MarkerSize',25);
plot(0,1,'bo','LineWidth',3,'MarkerSize',25);
plot(1,0,'bo','LineWidth',3,'MarkerSize',25);
xlabel('X1');
ylabel('X2');
title('RBF network decision boundary for XOR problem.');
