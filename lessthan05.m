function [out] = lessthan05(in) 
    if (in < .05)
        out = 1;
    else
        out = 0;
    end
end