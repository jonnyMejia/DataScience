function [Factorial]=factorial(n)
    if(n>1)
        Factorial= n.*factorial(n-1);
    else
        Factorial= 1;
    end
end