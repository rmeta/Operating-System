function x = LuckyNum_generator(M,N,a,flag)
x = zeros(1,N);
for i = 1 : N
    x(i) = rem(double(tic),M);
end
if flag
    pd = makedist("Uniform");
    [h1,p1,stats1] = chi2gof(x,'CDF',pd,'Alpha',a)
    [h2,p2,stats2] = chi2gof(x,'Alpha',a)
    
    figure;
    histogram(x);title("Histogram of data");
end
end
