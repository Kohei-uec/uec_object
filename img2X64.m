function X64 = img2X64(path)
    X = imread(path);
    RED = X(:,:,1);
    GREEN = X(:,:,2);
    BLUE = X(:,:,3);
    X64=floor(double(RED)/64) *4*4 + floor(double(GREEN)/64) *4 + floor(double(BLUE)/64);   
end