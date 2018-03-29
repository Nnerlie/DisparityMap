function [ difference ] = SUPPORT_CMP( L, R )
    %Compares the two support windows.
    difference = SAD(L,R);
end
