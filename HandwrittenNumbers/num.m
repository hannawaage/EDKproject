k = 8; 

classified = zeros(num_test, 1);

for i = 1:5 
    kSmallest = NaN(2, k); %% [class i; distance]
    kSmallest(2, :) = Inf;
    x = testv(i, :);
    for j = 1:num_train
        T = trainv(j, :);
        dist = (x' - T')'*(x' - T');
        if(dist < kSmallest(2, 1))
            kSmallest(:, end) = [trainlab(j); dist];
            kSmallest = sortrows(kSmallest.',2).';
        end
    end
    classified(i) = mode(kSmallest(1, :)); 
end



