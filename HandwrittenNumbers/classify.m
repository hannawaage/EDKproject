classified = NaN(num_test, 1);
K = 7;
for i = 1:20
    start = 1 + (i-1)*num_test/20;
    endin = i*num_test/20;
    x = testv(start:endin, :);  
    M = pdist2(x, trainv);
    k = 1;
%     for j = start:endin
%         [~, I] = min(M(k, :));
%         classified(j) = trainlab(I);  
%         k = k + 1;
%     end
    for j = start:endin
        [~, I] = mink(M(k, :), K);
        for n = 1:length(I)
            I(n) = trainlab(I(n));
        end
        right_class = mode(I);
        classified(j) = right_class;
        k = k + 1;
    end
end

C = confusionmat(classified, testlab); 

error_rate = (num_test-trace(C))/num_test;



