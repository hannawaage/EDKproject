function out = MSE(X, T, W, g)
    out = 0;
    N = size(X,2);
    for k = 1:N
        gk = g(X(:,k),W);
        tk = T(:,k);        
        out = out + 0.5 * (gk-tk)'*(gk-tk);
    end
end

