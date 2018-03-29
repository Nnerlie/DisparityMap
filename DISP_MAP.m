function [] = DISP_MAP(ImageL, ImageR,supportWindowSize)

matrixL = imread(ImageL);
matrixR = imread(ImageR);

if size(matrixL,3)==3
    matrixL = rgb2gray(matrixL);
end
if size(matrixR,3)==3
    matrixR = rgb2gray(matrixR);
end

%if size(matrixR,1)>=350 || size(matrixR,1)<=250 || size(matrixR,2)>=350 || size(matrixR,2)<=250
%   matrixR = imresize(matrixR,[300 300]);
%end
%
%if size(matrixL,1)>=350 || size(matrixL,2)>=350 || size(matrixL,1)<=250 || size(matrixL,2)<=250
%    matrixL = imresize(matrixL,[300 300]);
%end
searchWindowSize=supportWindowSize*3;

matrixL = padarray(matrixL, [floor(searchWindowSize/2) floor(searchWindowSize/2)], 0, 'both');
matrixR = padarray(matrixR, [floor(searchWindowSize/2) floor(searchWindowSize/2)], 0, 'both');
halfSupport = floor(supportWindowSize/2);
halfsearch = floor(searchWindowSize/2);
matrixDisp = zeros(size(matrixR));
for row = 1: (size(matrixL, 1) - searchWindowSize)
    row
    for col = 1: (size(matrixL, 2) - searchWindowSize)
        searchWindow = matrixL(row:(row+searchWindowSize), col:(col+searchWindowSize));
        supportWindow =  matrixR(row+(halfsearch-halfSupport):(row+halfsearch+halfSupport), col+(halfsearch-halfSupport):(col+halfSupport+halfsearch));
        matrixDisp(row+halfsearch, col+halfsearch)= PIXEL_DISP(searchWindow,supportWindow,[row,col],[row+halfsearch,col+halfsearch]);
    end
end
matrixDisp = matrixDisp(halfsearch+1:size(matrixDisp,1)-halfsearch-1, halfsearch+1:size(matrixDisp,2)-halfsearch-1);
matrixDisp = 255 * mat2gray(matrixDisp);
imshow(matrixDisp, [])
%imwrite(matrixDisp,'Result.png');
end
