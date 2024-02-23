function accuracy = crossValidation(cv,idx,data_pos, data_neg, learn, myClassify)
    %cross validation
    %cv = 5;
    %idx = 1:100;
    accuracy = zeros(cv);
    
    for i = 1:cv
        train_pos=data_pos(find(mod(idx,cv)~=(i-1)),:);
        eval_pos =data_pos(find(mod(idx,cv)==(i-1)),:);
        train_neg=data_neg(find(mod(idx,cv)~=(i-1)),:);
        eval_neg =data_neg(find(mod(idx,cv)==(i-1)),:);
        
        train=[train_pos; train_neg];
        eval=[eval_pos; eval_neg];
        
        train_label=[ones(size(train_pos,1),1); ones(size(train_neg,1),1)*(-1)];
        eval_label =[ones(size(eval_pos,1),1); ones(size(eval_neg,1),1)*(-1)];
        %学習
        model = learn(train, train_label);
        %分類
        [predicted_label, scores] = myClassify(model, eval);
        %評価
        ac = numel(find(eval_label==predicted_label))/numel(eval_label);
        accuracy(i, :) = ac;
    end

end