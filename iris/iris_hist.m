%% The Iris Task 2 - Histogram
clear all

x1all = load('Iris_TTT4275/class_1','-ascii');
x2all = load('Iris_TTT4275/class_2','-ascii');
x3all = load('Iris_TTT4275/class_3','-ascii');

close all
figure
for i = 1:4
    subplot(4,1,i)
    hold on
    histogram(x1all(:,i))
    histogram(x2all(:,i))
    histogram(x3all(:,i))
    hold off
    grid
    title("Feature " + i)
end
