function [ difference ] = SUPPORT_CMP( L, R )
    %Compares the two support windows.
    difference = SSD(L,R);
end
