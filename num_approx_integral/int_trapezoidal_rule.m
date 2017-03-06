% file: int_trapezoidal_rule.m
%
% This matlab file consists of a single subroutine,
%
%       function [I] = int_trapezoidal_rule(fun,a,b,n)
%
% where the user inputs:
%
%       fun  - function handle representing f(x)
%       a,b  - endpoints of the integration interval
%       n  - number of evenly-spaced points in [a,b] (including endpoints), where
%               x_j = a+(j-1)h,     h = (b-a)/(n-1),    j = 1,...,n
%
% and the subroutine outputs:
%
%       I  - numerical approximation of the integral.
%
% The program computes the numerical approximation of I(f) using the composite
% trapezoidal rule.
%
% This program was written by Benjamin Wallsten.
% Compiled on 3/3/2017.
%
%

function [I] = int_trapezoidal_rule(fun,a,b,n)
    % finding x_j given n,a,b
    h=(b-a)/(n-1);
    for i=1:n
        x_j(i)=a+(i-1)*h;
    end

    % computing the integral approximation
    int_sum_endpts=(h/2)*(fun(x_j(1)+fun(x_j(end))));
    int_sum=0;
    for k=2:n-1
        int_sum=int_sum+fun(x_j(k));
    end
    I=h*int_sum+int_sum_endpts;

end