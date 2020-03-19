function [W,n] = gradient_descent(gradient, W0, alpha)
    % Gradient decent sucks 
    W = W0;
    iterate = true;
    n = 1;
    while iterate && n < 1000
       grad = gradient(W);
       W = W - alpha * grad;
       iterate = norm(grad) > 1e-4;
       n = n+1;
    end
end

