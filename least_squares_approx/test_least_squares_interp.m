% file: test_least_squares_interp.m
%
% This matlab file consists of a single subroutine,
%
%       function test_least_squares_interp()
%
% where the program utilizes poly_least_squares.m to plot:
%   1. (xj,yj) (in blue) where
%       xj = -1+2*(j/15)
%       yj = 1/(2+sin(20*xj^2))
%           for j=0,...,15
%   2. the least-squares polynomial model (in red), for M = 15
%
% This program was written by Benjamin Wallsten.
% Compiled on 2/23/2017.
%
%
function test_least_squares_interp()
    % set up appropriate xj and yj
    for j=0:15
        xj(j+1)=-1+2*(j/15);
    end
    for j=0:15
        yj(j+1)=1/(2+sin(20*(xj(j+1)^2)));
    end
    domain=linspace(-1,1);

    % plotting data points
    figure(2)
    plot(xj,yj,'bo');
    hold on

    % plotting least-squares approximant for M=15
    M=15;
    [a_15,err_15]=poly_least_squares(xj,yj,M);
    a_15=a_15';
    a_15_flip=fliplr(a_15);
    p15=poly2sym(a_15_flip);
    fplot(p15,domain,'r');

end