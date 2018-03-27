function [ difference ] = SUPPORT_CMP( L, R ,size)
    %Compares the two support windows.
    difference = SAD(L,R);
end
