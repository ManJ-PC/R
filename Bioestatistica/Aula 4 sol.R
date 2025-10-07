L <- function(p)
  
  choose(100, 35) * p^35 * (1 - p)^65

l <- function(p)
  
  -log(L(p))



curve(L)

abline(v = 0.35, col = "red")



curve(l)

abline(v = 0.35, col = "red")



resultado <- optim(0.6, l, method = "BFGS", hessian = TRUE)

resultado$par

1 / resultado$hessian