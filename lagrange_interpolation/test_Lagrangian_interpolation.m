% file: test_Lagrange_interpolation.m
%
% This matlab file consists of a single subroutine,
%
%       function test_Lagrange_interpolation()
%
% where the program utilizes Lagrange_interp.m to plot:
%   1. the function f(x)=1/(1+20x^2) on the interval [-1,1] (in blue)
%   2. the Lagrangian interpolants (in red), using both
%       a. the evenly-spaced grid, xj=(-1)+2(j/N)
%       b. the unevenly-spaced grid, xj=cos((pi/N)j)
%      for both N=8 and N=20
%
% This program was written by Benjamin Wallsten.
% Compiled on 2/9/2017.
%
%
function test_Lagrange_interpolation()
    % set up f(x)
    fx=@(x) 1/(1+20*x^2);
    x=linspace(-1,1);

    % determine appropriate grid spaces for N=8 and N=20 on evenly- and
    % unevenely-spaced grids
    N=8;
    for j=0:N
        xj_8_even(j+1)=-1+2*(j/N);
    end
    for j=0:N
        xj_8_uneven(j+1)=cos((pi/N)*j);
    end

    N=20;
    for j=0:N
        xj_20_even(j+1)=-1+2*(j/N);
    end
    for j=0:N
        xj_20_uneven(j+1)=cos((pi/N)*j);
    end

    % determining polynomial interpolants using methods in Lagrange_interp.m
    % interpolants generated from even grid, N=8
    for k=0:8
        yi_8(k+1)=fx(xj_8_even(k+1));
    end
    y_8_even=Lagrange_interp(xj_8_even,yi_8,x);

    % interpolants generated from uneven grid, N=8
    for k=0:8
        yi_8(k+1)=fx(xj_8_uneven(k+1));
    end
    y_8_uneven=Lagrange_interp(xj_8_uneven,yi_8,x);

    % interpolants generated from even grid, N=20
    for k=0:20
        yi_20(k+1)=fx(xj_20_even(k+1));
    end
    y_20_even=Lagrange_interp(xj_20_even,yi_20,x);

    % interpolants generated from even grid, N=20
    for k=0:20
        yi_20(k+1)=fx(xj_20_uneven(k+1));
    end
    y_20_uneven=Lagrange_interp(xj_20_uneven,yi_20,x);

    % plotting f(x) and interpolation formulae in figures 1-4
    % plot of interpolant using even grid, N=8
    figure(1)
    fplot(fx,[-1,1],'b-')
    plot(xj_8_even,y_8_even,'r.-')

    % plot of interpolant using uneven grid, N=8
    figure(2)
    fplot(fx,[-1,1],'b-')
    plot(xj_8_uneven,y_8_uneven,'r.-')

    % plot of interpolant using even grid, N=20
    figure(3)
    fplot(fx,[-1,1],'b-')
    plot(xj_20_even,y_20_even,'r.-')

    % plot of interpolant using uneven grid, N=20
    figure(4)
    fplot(fx,[-1,1],'b-')
    plot(xj_20_uneven,y_20_uneven,'r.-')

end