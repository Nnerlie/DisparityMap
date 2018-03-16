function [ map ] = DISP_MAP( ImageL, ImageR)

matrixL = imread(ImageL);
matrixR = imread(ImageR);
matrixDisp = matrixL;
for row = 1: size(matrixL, 1)
        for col = 1: size(matrixL, 2)
           matrixDisp(row, col, 1)=PIXEL_DISP(matrixL(row,col),matrixR(row,col)); 
        end
end  
    surf(double(matrixDisp));
    imwrite(matrixDisp(:,:,1),"Result",'GIF');
end
