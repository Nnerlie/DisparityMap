function disparity_vector = PIXEL_DISP(search_window, support_window, top_corner, middle)
    sizeX = size(support_window, 2);
    sizeY = size(support_window, 1);
    min_diff = Inf();
    % scan through the support window
    for i = 1:(size(search_window, 1) - sizeY)
        for j = 1:(size(search_window, 2) - sizeX)
            % get the scan window from support window
            scan_support_window = support_window(i:i+sizeY, j:j+sizeX);
            
            % compare the windows
            diff = SUPPORT_COMP(scan_support_window, support_window);
            if diff < min_diff
                min_diff = diff;
                min_x = j + floor(sizeX / 2);
            end
        end
    end
    
    % location of x_min in the big image
    x_location = top_corner(2) + min_x;
    % return the vector (x) from the pixel to the smallest diff pixel
    disparity_vector = middle(2) - x_location;
end