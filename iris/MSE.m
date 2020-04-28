function out = MSE(X, T, W, discriminant)
    out = 0;
    N = size(X,2);
    for k = 1:N
        gk = discriminant(X(:,k),W);
        tk = T(:,k);        
        out = out + 0.5 * (gk-tk)'*(gk-tk);
    end
end

