function [ SSD ] = SSD( L, R )
    % Provides the sum of the squared difference between
    % two support windows.
    SSD = (L - R).^2;
    SSD= sum(sum(SSD));
end
