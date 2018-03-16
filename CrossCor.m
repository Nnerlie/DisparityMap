function [ cross ] = CrossCor( L, R )
    % Provides the cross correlation between
    % two support windows.
    cross = (L.*R);
end