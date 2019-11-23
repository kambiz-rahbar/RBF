function netPerformance(T,Y)

figure;
subplot(2,2,1);
plot(T,'b');
hold on;
plot(Y,'-.R');
grid minor;
legend('Targets','Network outputs');
title('Targets data vs Network outputs');
xlabel('sample number');
ylabel('data');

subplot(2,2,2);
line_data = [min([T(:);Y(:)]), max([T(:);Y(:)])];
plot(line_data, line_data,'b','LineWidth',2);
hold on;
plot(T,Y,'ko');
grid minor;
legend('Targets','Network outputs');
title(sprintf('R: %.4f',corr(T',Y')));
xlabel('target values');
ylabel('network outputs');

errorAbsValue = T-Y;
errorMean = mean(errorAbsValue);
errorStd = std(errorAbsValue);

subplot(2,2,3);
plot(errorAbsValue,'b');
grid minor;
title(sprintf('RMSE: %.4f',rms(errorAbsValue)));
xlabel('sample number');
ylabel('absolute error');

subplot(2,2,4);
histfit(errorAbsValue,50);
title(sprintf('mean: %.4f , std: %.4f',errorMean,errorStd));
grid minor;
xlabel('Frequency');
ylabel('error');
