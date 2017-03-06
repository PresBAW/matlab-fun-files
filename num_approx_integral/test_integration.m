% file: test_integration.m
%
% This matlab file consists of a single subroutine,
%
%       function test_integration()
%
% where the subroutine outputs:
%       1. a plot of the integrand function
%           I=intgral((1/(1+x^2))*cos((3/2)*e^(-x^2))-((x^3)/30))dx  on [-3,1]
%       2. a plot of the error versus n
%           e(n)=|I-I_n|    n=2,3,...,10000
%          of the composite midpoint rule, the composite trapezoidal rule, and
%          the composite Simpson rule.
%
% Program utilizes int_midpoint_rule.m, int_trapezoidal_rule.m, and
% int_Simpson_rule.m to compute numerical approximations.
%
% This program was written by Benjamin Wallsten.
% Compiled on 3/3/2017.
%
%

function test_integration()
    % set function and parameters
    syms x
    fun=@(x) (1/(1+x^2))*cos((3/2)*exp(-x^2))-((x^3)/30);
    f_int=int(1/(1+x^2))*cos((3/2)*exp(-x^2))-((x^3)/30);
    a=-3;
    b=1;
    domain=linspace(-3,1);
    n=linspace(2,10000);
    % reference value of integral
    I = 1.6851344770476;

    % error approximation of composite midpoint rule
    for i=1:length(n)
        e_I_cm_n(i)=abs(I-int_midpoint_rule(fun,a,b,n(i)));
    end

    % error approximation of composite trapezoidal rule
    for i=1:length(n)
        e_I_ct_n(i)=abs(I-int_trapezoidal_rule(fun,a,b,n(i)));
    end

    % error approximation of composite Simpson rule
    for i=1:length(n)
        e_I_cS_n(i)=abs(I-int_Simpson_rule(fun,a,b,n(i)));
    end

    % plot integrand function
    figure(1)
    fplot(f_int,[-3 1]);
    xlabel('x');
    ylabel('I(f(x))');
    legend('I(f)');

    % error plotting using loglog()
    figure(2)
    hold on
    % e_I_cm
    loglog(n,e_I_cm_n,'r')
    hold on
    % e_I_ct
    loglog(n,e_I_ct_n,'g')
    hold on
    % e_I_cS
    loglog(n,e_I_cS_n,'b')
    xlabel('n');
    ylabel('e(n)');
    legend('Composite Midpoint Rule','Composite Trapezoidal Rule','Composite Simpson Rule');

end