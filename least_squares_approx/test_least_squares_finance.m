% file: test_least_squares_finance.m
%
% This matlab file consists of a single subroutine,
%
%       function test_least_squares_finance()
%
% where the program utilizes poly_least_squares.m to plot:
%   1. the data points provided in Dow_Jones_2012_2017.dat in [0,1] (in blue)
%   2. the least-squares polynomial model (in red), for M = 1,2,4,8
%
% This program was written by Benjamin Wallsten.
% Compiled on 2/23/2017.
%
%
function test_least_squares_finance()
    % load .dat file
    filename='Dow_Jones_2012_2017.dat';
    data=load(filename);

    % set up appropriate x and y
    x=data(:,1);
    y=data(:,2);

    % plotting data points
    figure(1)
    plot(x,y);
    hold on

    % plotting least-squares approximant for M=1
    M=1;
    [a_1,err_1]=poly_least_squares(x,y,M);
    a_1=a_1';
    a_1_flip=fliplr(a_1);
    p1=poly2sym(a_1_flip);
    fplot(p1,[0,1],'r');

    % plotting least-squares approximant for M=2
    M=2;
    [a_2,err_2]=poly_least_squares(x,y,M);
    a_2=a_2';
    a_2_flip=fliplr(a_2);
    p2=poly2sym(a_2_flip);
    fplot(p2,[0,1],'r');

    % plotting least-squares approximant for M=4
    M=4;
    [a_4,err_4]=poly_least_squares(x,y,M);
    a_4=a_4';
    a_4_flip=fliplr(a_4);
    p4=poly2sym(a_4_flip);
    fplot(p4,[0,1],'r');

    % plotting least-squares approximant for M=8
    M=8;
    [a_8,err_8]=poly_least_squares(x,y,M);
    a_8=a_8';
    a_8_flip=fliplr(a_8);
    p8=poly2sym(a_8_flip);
    fplot(p8,[0,1],'r');
end