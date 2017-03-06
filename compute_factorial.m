% file: compute_factorial.m
%
% This matlab file consists of a single subroutine,
%
%       function [b] = compute_factorial(n)
%
% that calculates the factorial of a user-provided natural
% number, n.
%
% The factorial of a natural number is calculated by the
% product of the sequence of terms from 1 to n.
%
% This program was written by Benjamin Wallsten.
% Compiled on 1/22/2017.
%
%

function [b] = compute_factorial(n)
    % establish base case
    b = 1;

    % check if n < 0; throws error if true
    if (n<0)
        assert(false,'n must be >= 0 in order to compute n!')
    % check if n==0; return 1 if true
    elseif (n==0)
        b;
    else
        % return n! = n(n-1)(n-2)*...*1
        for i=1:n
            b = b*i;
        end
    end
end
