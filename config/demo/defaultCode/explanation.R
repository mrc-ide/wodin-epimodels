deriv(y1) <- sigma * (y2 - y1)
deriv(y2) <- R * y1 - y2 - y1 * y3
deriv(y3) <- -b * y3 + y1 * y2

initial(y1) <- 10.0
initial(y2) <- 1.0
initial(y3) <- 1.0

sigma <- user(10.0)
R <- user(28.0)
b <- user(2.66667)
