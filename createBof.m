function bof = createBof(codebook, list)
    n = size(list,2);
    bof = zeros(n,size(codebook,1));
    for j=1:n  % 各画像についての for-loop
        %j番目の画像読み込み
        I=rgb2gray(imread(list{j}));
        %SURF特徴抽出(detectSURFFeatures と extractFeatures)    
        p=detectSURFFeatures(I);
        [f,p2]=extractFeatures(I,p);
    
        for i=1:size(f,1)  % 各特徴点についての for-loop
            %一番近いcodebook中のベクトルを探してindexを求める
            %低速サーチ
            data = f(i,:);
            distances = zeros(500,1);
            for l = 1:500
                v = codebook(l,:);
                distances(l,1) = sqrt(sum((v-data).^2));
            end
            [m, index] = min(distances);
    
            %bofヒストグラム行列のj番目の画像のindexに投票　
            bof(j,index)=bof(j,index)+1;
        end
    end
    bof = bof ./ sum(bof,2); %正規化
end