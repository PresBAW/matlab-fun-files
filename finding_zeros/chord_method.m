% file: chord_method.m
%
% This matlab file consists of a single subroutine,
%
%       function [z0,iter,res,his] = chord_method(fun,a,b,tol,Nmax)
%
% where the user inputs:
%
%       fun  -   function handle representing f(x)
%       a,b  -   interval [a,b] thought to contain the zero
%       tol  -   max tolerance allowed for the increment
%                |x(k+1)-x(k)|
%       Nmax -   max number of iterations allowed
%
% and the subroutine outputs:
%
%       z0   -   approximation of the zero z_0
%       iter -   number of iterations to obtain z0
%       res  -   residual at z0, i.e., |f(z0)|
%       his  -   vector collecting all the elements of the
%                sequence {x(k)},k=0,1,... (convergence history)
%
% The subroutine stops when the increment at iteration k+1 is
% such that |x(k+1)-x(k)|<tol OR when the number of iterations
% reaches the max value Nmax.
%
% This program was written by Benjamin Wallsten.
% Compiled on 1/29/2017.
%
%

function [z0,iter,res,his] = chord_method(fun,a,b,tol,Nmax)
    % make sure no zero values appear in the slope of the chord
    if (b-a)==0
        error('Endpoints must not be the same.')
    elseif (fun(b)-fun(a))==0
        error('Cannot divide by zero.')
    else
        % establish slope of chord q_k and error
        q_k=(fun(b)-fun(a))/(b-a);
        his(1)=b-fun(b)*(1/q_k);
        err=1;
    end

    % declare and initialize initial counters
    iter=2;

    % begin zero search
    while err>=tol && iter<=Nmax
        his(iter)=his(iter-1)-(1/q_k)*fun(his(iter-1));
        q_k=(fun(his(iter))-fun(his(iter-1)))/(his(iter)-his(iter-1));
        err=abs(his(iter)-his(iter-1));
        iter=iter+1;
    end

    % check for either fail condition: err>=tol
    if err>=tol && iter>=Nmax
        warning('Error not within specified tolerance and number of acceptable iterations exceeded.')
    end

    % otherwise, zero has been found
    z0=his(iter-1);
    iter=iter-1;
    res=abs(fun(z0));
end
