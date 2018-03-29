function [ SSD ] = SSD( L, R )
    % Provides the sum of the squared difference between
    % two support windows.
    L = int16(L);
    R = int16(R);
    SSD = (L - R).^2;
    SSD= sum(sum(SSD));
end
