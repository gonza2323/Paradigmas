
-- Ejercicio 1.1.A

sumaCuadrados' 1 = 1
sumaCuadrados' n = n^2 + sumaCuadrados' (n-1)


-- Ejercicio 1.2.A

pares n = [ x | x <- [1 .. n], even x ]


-- Ejercicio 1.2.B



