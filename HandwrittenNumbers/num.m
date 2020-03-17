k = 8; 

classified = zeros(num_test, 1);



for i = 1:num_test
    k_smallest = NaN(2, k); %% [class i; distance]
    k_smallest(2, :) = Inf;
    x = testv(i, :);
    for j = 1:num_train
        T = trainv(j, :);
        dist = (x' - T')'*(x' - T');
        if(dist < k_smallest(2, 1))
            k_smallest(:, end) = [trainlab(j); dist];
            k_smallest = sortrows(k_smallest.',2).';
        end
    end
    classified(i) = mode(k_smallest(1, :)); 
end



