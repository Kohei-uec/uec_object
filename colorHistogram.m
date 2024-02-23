function h = colorHistogram(X64)
    X_vec=reshape(X64,1,numel(X64));
    h=histc(X_vec,[0:63]);
end