function [ SAD ] = SAD( L, R )
    % Provides the sum of absolute distances between
    % two support windows.
    L = int16(L);
    R = int16(R);
    SAD = (L - R);
    SAD= sum(sum(abs(SAD)));
end
