function [ SAD ] = SAD( L, R )
    % Provides the sum of absolute distances between
    % two support windows.
    SAD = (L - R);
    SAD= sum(abs(SAD));
end
