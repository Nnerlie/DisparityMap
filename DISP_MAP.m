function [] = DISP_MAP(ImageL, ImageR,supportWindowSize)

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
matrixDisp = zeros(size(matrixR));
for row = 1: size(matrixL, 1)
    row
    for col = 1: size(matrixL, 2)
        [supportWindow,empty,empty1] = EXTRACT_WIN(matrixL,supportWindowSize,row,col);
        [searchWindow,topRow,topCol] =  EXTRACT_WIN(matrixR,searchWindowSize,row,col);
        matrixDisp(row, col)= PIXEL_DISP(searchWindow,supportWindow,[topRow,topCol],[row,col]);
    end
end
matrixDisp = 1 + 2.*(matrixDisp - min(matrixDisp))./(max(matrixDisp) - min(matrixDisp))
imshow(matrixDisp, [])
size(matrixDisp)
%imwrite(matrixDisp,'Result.png');
end
