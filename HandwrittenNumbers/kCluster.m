M = 64;
K = 7;

%% Find indeces of the vectors of the individual classes
class_lengths = ones(1, 10);
max_num = 6743;
classi = NaN(10, max_num);
for i = 1:num_train
    cl = trainlab(i) + 1;
    classi(cl, class_lengths(1, cl)) = i;
    class_lengths(1, cl) = class_lengths(1, cl) + 1;
end

%% Find class specific clusters - Cis is a 3D Matrix of cluster matrices, each w/ 64 templates 
Cis = NaN(10, M, vec_size);
for j = 1:10
    n = class_lengths(j) - 1;
    classVectors = NaN(n, vec_size);
    k = 1; 
    while(~isnan(classi(j, k)))
        ind = classi(j, k);
        classVectors(k, :) = trainv(ind, :);
        k = k + 1;
    end
    [~, Cis(j, :, :)] = kmeans(classVectors, M);
end
C = reshape(Cis, [10*M vec_size]);
%% Find smallest distance 

classified = NaN(num_test, 1);
for i = 1:20
    start = 1 + (i-1)*num_test/20;
    endin = i*num_test/20;
    x = testv(start:endin, :);
    M_dist = pdist2(x, C);
    k = 1;
    for j = start:endin
        [~, I] = mink(M_dist(k, :), K);
        for l = 1:length(I)
            I(l) = floor((I(l)-1)/M);
        end
        right_class = mode(I);
        classified(j) = right_class;
        k = k + 1;
    end
end

Conf = confusionmat(classified, testlab); 

error_rate = (num_test-trace(Conf))/num_test;