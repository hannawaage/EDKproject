%% The Iris Task
clear all

x1all = load('Iris_TTT4275/class_1','-ascii');
x2all = load('Iris_TTT4275/class_2','-ascii');
x3all = load('Iris_TTT4275/class_3','-ascii');

Ntest = 30;
% Use first 30 samples to train:
xtrain = [x1all(1:Ntest,:); x2all(1:Ntest,:); x3all(1:Ntest,:)];
xtest = [x1all(Ntest+1:end,:); x2all(Ntest+1:end,:); x3all(Ntest+1:end,:)];

% Use last 30 samples to train:
% xtrain = [x1all(end-Ntest+1:end,:); x2all(end-Ntest+1:end,:); x3all(end-Ntest+1:end,:)];
% xtest = [x1all(1:end-Ntest,:); x2all(1:end-Ntest,:); x3all(1:end-Ntest,:)];

C = 3;                                  % Number of classes
D = size(xtrain,2);                     % Dimension of x
W = zeros(C,D+1);                       % Weight matrix
sigmoid = @(x) 1./(1+exp(-x));          % Sigmoid function
gk = @(xk,W) sigmoid(W*xk);             % Discriminant function


%% Training
X = [xtrain(1:Ntest*C,:)'; ones(1, Ntest*C)];                                                      % Feature matrix
T = [kron(ones(1,Ntest), [1 0 0]'), kron(ones(1,Ntest), [0 1 0]'), kron(ones(1,Ntest), [0 0 1]')]; % Target values

% W = fminunc(@(w)MSE(X,T,w,gk), W);

% Gradient decent sucks 
alpha = 0.02;
iterate = true;
n = 1;
while iterate && n < 3000
   grad = MSE_grad(X,T,W,gk);
   W = W - alpha * grad;
   iterate = norm(grad) > 1e-4;
   n = n+1;
end

%% Plotting training data
% Works when only using 2 features

% close all
% figure(2)
% hold on
% 
% plot(x1(:,1), x1(:,2), 'o')
% plot(x2(:,1), x2(:,2), '*')
% plot(x3(:,1), x3(:,2), 'x')
% grid

% discriminant = @(x,y, i) W(i,1).*x + W(i,2).*y + W(i,3);
% fimplicit(@(x,y) discriminant(x,y,1)-discriminant(x,y,2))
% fimplicit(@(x,y) discriminant(x,y,1)-discriminant(x,y,3))
% fimplicit(@(x,y) discriminant(x,y,3)-discriminant(x,y,2))
% legend('c1','c2','c3','1-2','1-3','2-3')

%% Testing
Xtest = [xtest'; ones(1, size(xtest,1))];               % Test cases
Ttest = [repelem(1,20), repelem(2,20), repelem(3,20)];  % Solution
g = gk(X,W);
[~,classes] = max(g);                                   % Class assigned

figure
subplot(2,1,1)
stairs(classes,'LineWidth', 2)
grid
legend('Assigned class')
ylabel('class')

subplot(2,1,2)
stairs(Ttest,'LineWidth', 2)
grid
legend('True class')
xlabel('Sample number')
ylabel('class')