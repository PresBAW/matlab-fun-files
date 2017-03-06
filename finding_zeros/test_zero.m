% file: test_zero.m
%
% This matlab file consists of a single subroutine,
%
%       function [zc,zn] = test_zero()
%
% that approximates the smallest zero of the fifth-order
% Chebyshev polynomial
%
%       f(x) = 16x^5-20x^3+5x,      x in [-1,1]
%
% using the chord method (zc) and the Newton method (zn).
% These approximations will be compared with the
% analytical result
%
%       z0 = cos((9*pi)/10).
%
% The method returns the vector [zc,zn], and also does
% the following:
%
%   1. Produce a graph of the f(x) in figure(1).
%   2. Plots in figure(2) the convergence history,
%      the error
%           e_k = abs(x^(k)-z_0)
%      versus k, in a semi-log scale, for the chord
%      and Newton methods.
%   3. Plots in figure(3)
%           e_(k+1) = abs(x^(k+1)-z_0)   (as y-axis)
%      versus
%           e_k = abs(x^(k)-z_0)         (as x-axis)
%      in a log-log scale for the chord and Newton
%      methods.
%
% This program was written by Benjamin Wallsten.
% Compiled on 1/29/2017.
%
%

function [zc,zn] = test_zero()
    % Establish f(x) as f, df as f'(x), and z0
    f=@(x) 16*x^5-20*x^3+5*x;
    df=@(x) 80*x^4-60*x^2+5;   % for Newton method
    z0=cos((9*pi)/10);

    % Declare and assign initial input values for tol,
    % Nmax, a, b, and x0
    tol=1e-16;
    Nmax=20000;
    a=-0.99;
    b=-0.9;
    x0=-0.99;

    % Compute zero approximation of f(x)
    [zc_0,zc_iter,zc_res,zc_his]=chord_method(f,a,b,tol,Nmax);  % possibly need to assign zc=z0 for each of these
    zc=zc_0;
    [zn_0,zn_iter,zn_res,zn_his]=Newton_method(f,df,x0,tol,Nmax);
    zn=zn_0;

    % Begin figure(1) plot of f(x)
    figure(1)
    clf
    fplot(f,[-1 1],'r-')
    xlabel('x from [-1,1]','Fontsize',16)
    ylabel('y','Fontsize',16)
    grid
    legend('f(x) = 16x^5-20x^3+5x')

    % Begin figure(2) semilog plot comparing Chord and Newton methods
    if zc_iter>zn_iter
        x_plot=zc_iter;
    else
        x_plot=zn_iter;
    end
    figure(2)
    clf
    x=1:x_plot;
    semilogy(x,zc_his,x,zn_his,'Linewidth',1.5)
    xlabel('k','Fontsize',16)
    ylabel('|x^{(k)}-z_0|','Fontsize',16)
    grid
    legend('Chord Method','Newton Method')

    % Begin figure(3) loglog plot comparing Chord and Newton methods e_k+1 and e_k
    figure(3)
    clf
    loglog(zc_his(1:end-1),zc_his(2:end),zn_his(1:end-1),zn_his(2:end),'Linewidth',1.5)
    xlabel('e_{n}','Fontsize',16)
    ylabel('e_{n+1}','Fontsize',16)
    grid
    legend('Chord Method','Newton Method')

end