%% The Iris Task 2 - Histogram
clear all

x1 = load('Iris_TTT4275/class_1','-ascii');
x2 = load('Iris_TTT4275/class_2','-ascii');
x3 = load('Iris_TTT4275/class_3','-ascii');

close all
figure
for i = 1:4
    subplot(4,1,i)
    hold on
    histogram(x1(:,i))
    histogram(x2(:,i))
    histogram(x3(:,i))
    hold off
    grid
    title("Feature " + i)
end
