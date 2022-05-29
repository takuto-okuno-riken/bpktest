function bpkdemo
    % If the test statistic has a p-value below an appropriate threshold (e.g. p < 0.05)
    % then the null hypothesis of homoskedasticity is rejected.

    % case 1: y = b0 + b1*x1 + e (gaussian distribution)
    b1 = 1.5; b0 = -0.2;
    x1 = [0.1:0.1:10].';
    y = b0 + b1*x1 + randn(100,1);
    x = [x1 ones(size(x1,1),1)]; % need to add intercept
    [b,~,r] = regress(y, x); % get residuals
    % bpk test (p-value should be bigger than 0.05)
    [p, lm] = bpktest(r, x);
    figure; scatter(x1,y); title(['bpk test p=' num2str(p)]);

    % case 2: y = b0 + b1*x1 + e (heteroskedasticity case)
    y = b0 + b1*x1 + x1 .* randn(100,1) * 0.3;
    x = [x1 ones(size(x1,1),1)]; % need to add intercept
    [b,~,r] = regress(y, x); % get residuals
    % bpk test (p-value should be less than 0.05)
    [p, lm] = bpktest(r, x);
    figure; scatter(x1,y); title(['bpk test p=' num2str(p)]);

    % case 3: y = b0 + b1*x1 + e (uniform distribution)
    b1 = 1.5; b0 = -0.2;
    y = b0 + b1*x1 + rand(100,1)*3;
    x = [x1 ones(size(x1,1),1)]; % need to add intercept
    [b,~,r] = regress(y, x); % get residuals
    % bpk test (p-value should be bigger than 0.05)
    [p, lm] = bpktest(r, x);
    figure; scatter(x1,y); title(['bpk test p=' num2str(p)]);
end
