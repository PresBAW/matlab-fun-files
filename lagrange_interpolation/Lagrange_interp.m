% file: Lagrange_interp.m
%
% This matlab file consists of a single subroutine,
%
%       function [y] = Lagrange_interp(xi,yi,x)
%
% where the user inputs:
%
%       xi  - vector of interpolation nodes
%       yi  - vector of data points at interpolation nodes
%       x   - vector of points in which we evaluate the polynomial interpolant
%
% and the subroutine outputs:
%
%       y   - polynomial interpolant evaluated at x
%
% The program computes the Lagrangian interpolant of a given set of data points
% (xi,yi), i=1,2,....
%
% This program was written by Benjamin Wallsten.
% Compiled on 2/9/2017.
%
%

function [y] = Lagrange_interp(xi,yi,x)
    % finding Lagrange characteristic polynomials
    n=length(xi);
    m=length(x);
    L=ones(n,m);
    for i=1:n
        for j=1:n
            if j~=i
                L(i,:)=L(i,:).*(x-xi(j))/(xi(i)-xi(j));
            end
        end
    end

    % Using the Lagrange characteristic polynomials found to
    % construct the Lagrange interpolation formula
    y=zeros(1,m);
    for k=1:n
        for z=1:m
            y(1,z)=y(1,z)+yi(k)*L(k,z);
        end
    end
end