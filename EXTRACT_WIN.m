function [window] = EXTRACT_WIN(image,windowSize,row,col)
%EXTRACT_WIN Extracts the window from the image taking care of the edges.
if row<round(windowSize/2) % if pixel is in the top part of image
    if col<round(windowSize/2) % if pixel is in the top left part of image
        window=image(1:windowSize,1:windowSize);
    elseif size(image,2)-col<round(windowSize/2) % if pixel is in the top right part of image
        window=image(size(image,1)-windowSize:size(image,1),size(image,2)-windowSize:size(image,2));
    else % if pixel is in the top middle part of image
        window=image(1:windowSize,(col-(windowSize-1/2)):(col+(windowSize-1/2)));
    end
elseif size(image,1)-row<round(windowSize/2) % if pixel is in the bottom part of image
    if col<round(windowSize/2)% if pixel is in the bottom left part of image
        window=image(size(image,1)-windowSize:size(image,1),1:windowSize);
    elseif size(image,2)-col<round(windowSize/2) % if pixel is in the bottom right part of image
        window=image(size(image,1)-windowSize:size(image,1),size(image,2)-windowSize:size(image,2));
    else % if pixel is in the bottom middle part of image
        window=image(size(image,1)-row:size(image,1),(col-(windowSize-1/2)):(col+(windowSize-1/2)));
    end
elseif col<round(windowSize/2) % if pixel is in the middle left part of the image
    window=image((row-(windowSize-1/2)):(row+(windowSize-1/2)),1:windowSize);
elseif size(image,2)-col<round(windowSize/2) % if pixel is in the middle right part of the image
    window=image((row-(windowSize-1/2)):(row+(windowSize-1/2)),size(image,2)-windowSize:size(image,2));
else
    window=image((row-(windowSize-1/2)):(row+(windowSize-1/2)),(col-(windowSize-1/2)):(col+(windowSize-1/2)));
end
end

