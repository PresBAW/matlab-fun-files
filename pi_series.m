% file: pi_series.m
%
% This matlab file consists of a single subroutine,
%
%       function pi_series()
%
% that plots the first 10 partial sums of both the
% Plouffe and Euler series of pi.
%
% There is also an added extra credit portion that
% returns to the command window the smallest integer
% numbers n1 and n2 that satisfy certain threshold
% inequalities for the series.
%
% Extra credit: return the smallest integers n1 and
% n2 from the Plouffe and Euler series, respectively,
% such that:
%
%       abs(P(n1+1)-pi) < 10^-5 and
%       abs(E(n2)-pi) < 10^-5,
%
% and subsequently indicate which series converges
% to pi faster.
%
% This program was written by Benjamin Wallsten.
% Compiled on 1/22/2017.
%
%

function pi_series()
    % Clear previous figure before proceeding
    clf

    % Declare vectors P and E for the Plouffe and
    % Euler series, respectively
    P = zeros(1,10);
    E = zeros(1,10);

    % Begin calculating P(1) from k=0 and P(k+1)
    % from k=1:9
    P(1) = (1/16^0)*((4/(8*0+1))-(2/(8*0+4))-(1/(8*0+5))-(1/(8*0+6)));
    for k=1:9
        P(k+1) = P(k) + (1/16^k)*((4/(8*k+1))-(2/(8*k+4))-(1/(8*k+5))-(1/(8*k+6)));
    end

    % Begin calculating E(k+1) from k=1:10 using
    % partial_sum to count summation before taking
    % the square root after each iteration
    partial_sum = 0;
    for k=1:10
        partial_sum = partial_sum + 1/k^2;
        E(k) = sqrt(6)*sqrt(partial_sum);
    end

    % Plot both series on the same figure
    figure(1);
    plot(P(1:10),'r.');
    hold;
    plot(E(1:10),'b.');
    title('Plots of the first 10 partial sums of the Plouffe and Euler series')
    xlabel('Partial sum vector element')
    ylabel('Partial sum value at vector element')

    % --------------------------------------------------
    % Extra credit: Find the smallest n1 and n2
    % to satisfy the inequalities indicated above;
    % we begin with declaring our desired TOL
    TOL = 1e-5;

    % Now we find n1 for P using e as a loop parameter
    p_series = P(1);
    e = 1;
    n1 = 1;
    while e>=TOL
        p_series = p_series + (1/16^n1)*((4/(8*n1+1))-(2/(8*n1+4))-(1/(8*n1+5))-(1/(8*n1+6)));
        e = abs(p_series-pi);
        n1 = n1+1;
    end

    % We return n1-2 since the algorithm will iterate
    % n1 once more after the n1 that violates the
    % desired conditions
    n1_smallest=n1-2;
    fprintf('\nSmallest n1 in the Plouffe series: %d.',n1_smallest)

    % Now we find n2 for E using e as a loop parameter
    e = 1;
    e_series = 0;
    partial_e = 0;
    n2 = 1;
    while e>=TOL
        partial_e = partial_e + (1/n2^2);
        e_series = sqrt(6)*sqrt(partial_e);
        e = abs(e_series-pi);
        n2 = n2+1;
    end

    % We return n2-2 since the algorithm will iterate
    % n2 once more after the n2 that violates the
    % desired conditions
    n2_smallest=n2-2;
    fprintf('\nSmallest n2 in the Euler series: %d.',n2_smallest)

    % Display which series converges faster
    s=[string('Plouffe') string('Euler')];
    if n1_smallest<=n2_smallest
        fprintf('\nThe %s series converges faster.\n',s(1))
    else
        fprintf('\nThe %s series converges faster.\n',s(2))
    end
end