function [ SSD ] = SSD( L, R )
    % Provides the sum of the squared difference between
    % two matrices of the same size.
    intL = int16(L);
    intR = int16(R);
    
    SSD = (intL - intR).^2;
    
    SSD= sum(sum(SSD));
end
