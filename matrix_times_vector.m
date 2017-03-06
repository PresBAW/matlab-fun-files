% file: matrix_times_vector.m
%
% This matlab file consists of a single subroutine,
%
%       function [y] = matrix_times_vector(A,x)
%
% that computes the product of an n-dimensional square matrix
% A and an n-dimensional (column) vector x. The components of
% the (column) vector y = Ax are defined as the sum of the
% products of the element in row i and column j of A (from 1
% to j) and the jth row in x.
%
% The user is expected to provide:
%       A       : an nxn (square) matrix
%       x       : an nx1 (column) matrix
%
% Errors will be thrown if the user does not enter appropriate
% matrices A and x.
%
% This program was written by Benjamin Wallsten.
% Compiled on 1/22/2017.
%
%

function [y] = matrix_times_vector(A,x)
    % declare and initialize y
    y = zeros(size(x));

    % Get sizes of inputs A and x
    size_A = size(A);
    size_x = size(x);

    % Declare other counter variables
    n = size_A(1);
    partial_row_sum = 0;

    % Check if A is square matrix
    if (size_A(1)~=size_A(2))
        assert(false,'A is not a square matrix')
    end

    % Check if x is a column matrix
    if (length(x(1,:))~=1)
        assert(false,'x is not a column matrix')
    end

    % Check if A and x are the same size
    if (size_A(1)~=size_x)
        assert(false,'A and x are not the same size')
    end

    % Begin computation of y_i
    for i=1:n
        for j=1:n
            partial_row_sum = partial_row_sum + A(i,j)*x(j);
        end
        y(i) = partial_row_sum;
        partial_row_sum = 0;
    end
end
