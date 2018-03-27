
function [window,topRow,topCol] = EXTRACT_WIN(image,windowSize,row,col)
%EXTRACT_WIN Extracts the window from the image taking care of the edges.
halfWindow = floor(windowSize/2);
if row<=halfWindow % if pixel is in the top part of image
    if col<=halfWindow % if pixel is in the top left part of image
        window=image(1:windowSize,1:windowSize);
        topRow=1;
        topCol=1;
    elseif size(image,2)-col<=halfWindow % if pixel is in the top right part of image
        window=image(1:windowSize,size(image,2)-windowSize:size(image,2));
        topRow=1;
        topCol=size(image,2)-windowSize;
    else % if pixel is in the top middle part of image
        window=image(1:windowSize,(col-(halfWindow)):(col+(halfWindow)));
        topRow=1;
        topCol=(col-(halfWindow));
    end
elseif size(image,1)-row<=halfWindow % if pixel is in the bottom part of image
    if col<=halfWindow% if pixel is in the bottom left part of image
        window=image(size(image,1)-windowSize:size(image,1),1:windowSize);
        topRow=size(image,1)-windowSize;
        topCol=1;
    elseif size(image,2)-col<=halfWindow % if pixel is in the bottom right part of image
        window=image(size(image,1)-windowSize:size(image,1),size(image,2)-windowSize:size(image,2));
        topRow=size(image,1)-windowSize;
        topCol=size(image,2)-windowSize;
    else % if pixel is in the bottom middle part of image
        window=image(size(image,1)-halfWindow:size(image,1),(col-halfWindow):(col+halfWindow));
        topRow=size(image,1)-halfWindow;
        topCol=(col-halfWindow);
    end
elseif col<=halfWindow % if pixel is in the middle left part of the image
    window=image((row-halfWindow):(row+halfWindow),1:windowSize);
    topRow=(row-halfWindow);
    topCol=1;
elseif size(image,2)-col<=halfWindow % if pixel is in the middle right part of the image
    window=image((row-halfWindow):(row+halfWindow),size(image,2)-windowSize:size(image,2));
    topRow=(row-halfWindow);
    topCol=size(image,2)-windowSize;
else
    window=image((row-halfWindow):(row+halfWindow),(col-halfWindow):(col+halfWindow));
    topRow=(row-halfWindow);
    topCol=(col-halfWindow);
end
end

