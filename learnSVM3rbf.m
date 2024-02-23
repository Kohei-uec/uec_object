function model = learnSVM3rbf(data, label)
    %LEARN 線形カーネルでSVM学習
    
    %３倍の次元に写像
    data3=repmat(sqrt(abs(data)).*sign(data),[1 3]).* [0.8*ones(size(data)) 0.6*cos(0.6*log(abs(data)+eps)) 0.6*sin(0.6*log(abs(data)+eps))];
    
    training_data = data3;
    training_label = label;
    model = fitcsvm(training_data, training_label,'KernelFunction','rbf', 'KernelScale','auto');
    %model = fitcsvm(training_data, training_label,'KernelFunction','linear');
end