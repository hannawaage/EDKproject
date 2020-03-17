function grad = MSE_grad(X,T,W, g)
    grad = zeros(size(W));
    for k = 1:size(X,2)
        xk = X(:,k);
        tk = T(:,k);
        gk = g(X(:,k),W);
        grad = grad + ((gk-tk) .* gk .* (1-gk))*xk.';        
    end
end

