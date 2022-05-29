%%
% Heteroskedasticity test based on Koenker (Breush-Pagan) (Breush-Pagan 1979; Koenker 1981)
% https://en.wikipedia.org/wiki/Breusch%E2%80%93Pagan_test
% https://jp.mathworks.com/matlabcentral/fileexchange/24722-heteroskedasticity-test
% input:
%  X       observations x regressors matrix (this should include intercept)
%  r       residuals of regression

function [pval, lm] = bpktest(r, X)
    r2 = r.*r;  % squared residuals

    n = size(X,1); % obsevation number
    p = size(X,2); % degrees of freedom

    % calc R^2 of squared residuals (regress function is good)
    [~,~,~,~,stats] = regress(r2, X);
    
    % pVal = 1-cdf(LM statistic, df) from a Chi-squared distribution. 
    % where LM statistic = n * R^2 of squared residuals
    lm = n * stats(1);
    pval = 1 - chi2cdf(lm, p-1);
end
