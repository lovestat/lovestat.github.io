set.seed(123)
n <- 100; p <- 3
X <- matrix(rnorm(n * p), nrow = n)
beta <- matrix(rep(1, p), ncol = 1)
y <- X %*% beta + 3 * rnorm(n)

mu_y <- mean(y)
sd_y <- sd(y)
y_std <- (y - mu_y) / sd_y
fit1 <- lm(y_std ~ X)
coef(fit1)


X_std <- scale(X)
fit2 <- lm(y_std ~ X_std)
coef(fit2)

coef(fit2)[2:4] / apply(X, 2, sd)

coef(fit2)[1]  - sum(coef(fit2)[2:4] * apply(X, 2, mean) / apply(X, 2, sd))


