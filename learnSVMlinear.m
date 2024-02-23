function model = learnSVMlinear(data, label)
    %LEARN 線形カーネルでSVM学習
    training_data = data;
    training_label = label;
    %model = fitcsvm(training_data, training_label,'KernelFunction','rbf', 'KernelScale','auto');
    model = fitcsvm(training_data, training_label,'KernelFunction','linear');
end