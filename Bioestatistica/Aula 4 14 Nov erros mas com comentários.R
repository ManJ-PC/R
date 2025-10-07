L <- function(p)
   choose(100, 35)* p^35 * (1-p)^65 # constante antes não interessa, porque será maximizada no mesmo sítio! 100 * 
# a função de verosimilhança o intervalo de confiança menor, colapsar no mesmo valor.. menor incerteza
curve(L)
abline(v = 0.35, col = "red") # maximizar o valor máximo de verosimilhança!

# logarítmico para evitar problemas numéricos, máximizar analiticamente
# derivar e encontrar o zero, útil .. encontrar os zeros
# métodos númericos e optimização, log de verosimilhança ou LOG de L
# aplicar logaritmo à função de verosimilhança!

l <- function(p)
  -log(L(p))

curve(l)
abline(v = 0.35, col = "red")

resultado <- ?optim(0.5, l, method = "BFGS")
# tentou avaliar por pontos não admissíveis fora do in tervalo de 0 a 1
resultado$par
names(resultado)
resultado$value
resultado$counts
resultado$convergence
resultado$message

#Hessiana é comum designação para a 2ª derivada

resultado <- optim(0.6, l, method = "BFGS", hessian = TRUE)
resultado$par
1 / resultado$hessian