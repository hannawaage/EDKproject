close all;
counter = 0;
figure(1);
sgtitle('The first 9 wrongly classified numbers')
i = 0;
tit = 'Classified as ';
while counter < 9
    i = i + 1;
    if classified(i) ~= testlab(i)
        counter = counter + 1;
        subplot(3, 3, counter);
        x = zeros(28,28); x(:)= testv(i,:);
        image(x.');
        fulltit = [tit,  num2str(classified(i))];
        title(fulltit);
    end
end

figure(2);
counter = 0;
sgtitle('Some random correctly classified numbers')
i = 0;
tit = 'Classified as ';
while counter < 9
    i = i + 285;
    if classified(i) == testlab(i)
        counter = counter + 1;
        subplot(3, 3, counter);
        x = zeros(28,28); x(:)= testv(i,:);
        image(x.');
        fulltit = [tit,  num2str(classified(i))];
        title(fulltit);
    end
end
