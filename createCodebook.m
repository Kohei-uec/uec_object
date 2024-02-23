function codebookFn = createCodebook(list)
    %全画像のSURF特徴量を抽出
    Features=[];
    for i=1:200
      I=rgb2gray(imread(list{i}));
      p=detectSURFFeatures(I);
      [f,p2]=extractFeatures(I,p);
      Features=[Features; f];
    end
    
    %k-means
    k = 500;
    [idx,codebook]=kmeans(Features, k);
    codebookFn = 'codebook.mat';
    save(codebookFn,'codebook');
end