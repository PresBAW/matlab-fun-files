% file: compute_Euclidean_norm.m
%
% This matlab file consists of a single subroutine,
%
%       function [z] = compute_Euclidean_norm(x)
%
% that computes the norm for an arbitrary user-provided input
% vector, x.
%
% The input vector is an n-dimensional column or row matrix.
%
% The Euclidean norm of an n-dimensional vector is defined
% as the square root of the sum of the square of the elements
% 1 to n of x.
%
% This program was written by Benjamin Wallsten.
% Compiled on 1/22/2017.
%
%

function [z] = compute_Euclidean_norm(x)
    % Declare the sum
    z = 0;

    % Compute the squares of the elements in x
    z_squared = x.*x;

    % Sum the elements
    for i=1:length(x)
        z = z + z_squared(i);
    end

    % Take the square root and return z
    z = sqrt(z);
end