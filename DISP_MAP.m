function [ matrixDisp ] = DISP_MAP(ImageL, ImageR,supportWindowSize)

matrixL = imread(ImageL);
matrixR = imread(ImageR);

if size(matrixL,3)==3
    matrixR = rgb2gray(matrixR);
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
matrixDisp = matrixL;
for row = 1: size(matrixL, 1)
    for col = 1: size(matrixL, 2)
        supportWindow = EXTRACT_WIN(matrixL,supportWindowSize,row,col);
        searchWindow =  EXTRACT_WIN(matrixR,searchWindowSize,row,col);
        matrixDisp(row, col, 1)=PIXEL_DISP(supportWindow,searchWindow);
    end
end
imshow(matrixDisp);
%imwrite(matrixDisp,'Result.png');
end
