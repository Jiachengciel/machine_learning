function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
% J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
z = X*theta;
h = sigmoid(z);
n = size(theta,1);

a = -y'*log(h);
b = -(ones(m,1)-y)'*log(ones(m,1)-h);
c = theta(2:n,:)'*theta(2:n,:);

J = 1/m*(a+b) + lambda/(2*m)*c;

grad(1) = 1/m*(h - y)'*X(:,1);

for i=2:n
    grad(i) = 1/m*((h-y)'*X(:,i) + lambda*theta(i));
end
% =============================================================

end