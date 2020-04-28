close all;
counter = 0;
figure(1);
sgtitle('Some often wrongly classified numbers', 'FontSize', 30);
i = 0;
tit = 'Classified as ';
addTit = ', true label is ';
oftenmistaken = [2 7; 
                 3 8;
                 4 9; 
                 7 1; 
                 5 2];
while counter < 9
    i = i + 3;
    if classified(i) ~= testlab(i)
        for j = 1:length(oftenmistaken)
            it = (classified(i) == oftenmistaken(j, 1) && testlab(i) == oftenmistaken(j, 2)) || (classified(i) == oftenmistaken(j, 2) && testlab(i) == oftenmistaken(j, 1));
            if it
                break
            end
        end
        if it
            counter = counter + 1;
        subplot(3, 3, counter);
        x = zeros(28,28); x(:)= testv(i,:);
        image(x.');
        fulltit = [tit,  num2str(classified(i)), addTit, num2str(testlab(i)) ];
        title(fulltit, 'FontSize', 24);
        end
    end
end

figure(2);
counter = 0;
sgtitle('Some random correctly classified numbers', 'FontSize', 30);
i = 0;
tit = 'Classified as ';
while counter < 9
    i = i + 498;
    if classified(i) == testlab(i)
        counter = counter + 1;
        subplot(3, 3, counter);
        x = zeros(28,28); x(:)= testv(i,:);
        image(x.');
        fulltit = [tit,  num2str(classified(i)), addTit, num2str(testlab(i)) ];
        title(fulltit, 'FontSize', 24);
    end
end
