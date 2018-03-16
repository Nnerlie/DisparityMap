function [ difference ] = SUPPORT_CMP( L, R ,size)
    %Compares the two support windows.
    difference = SSD(L,R);
end
