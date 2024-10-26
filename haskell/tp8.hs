
-- Ejercicio 1.A Volumen de una esfera
sphereVolume :: Float -> Float
sphereVolume radius = (4/3) * pi * radius^3


-- Ejercicio 1.B
sumCoins :: Int -> Int -> Int -> Int -> Int -> Float
sumCoins a b c d e = 0.01 * fromIntegral a
    + 0.05 * fromIntegral b
    + 0.10 * fromIntegral c
    + 0.50 * fromIntegral d
    + fromIntegral e


-- Ejercicio 1.C
incrementTriplet :: (Int, Int, Int) -> (Int, Int, Int)
incrementTriplet (x, y, z) = (x + 1, y + 1, z + 1)


-- Ejercicio 1.D
square :: Num a => a -> a
square x = x^2


-- Ejercicio 1.E
fourthPower :: Num a => a -> a
fourthPower x = square (square x)


-- Ejercicio 1.F
avgOfThree :: Fractional a => a -> a -> a -> a
avgOfThree a b c = (a + b + c) / 3


-- Ejercicio 1.G
maxOfThree :: Ord a => a -> a -> a -> a
maxOfThree x y z = max x (max y z)


-- Ejercicio 1.H
maxOfSix :: Ord a => a -> a -> a -> a -> a -> a -> a
maxOfSix a b c d e f = max (maxOfThree a b c) (maxOfThree d e f)


-- Ejercicio 1.I
area :: Float -> Float -> Float -> Float
area a b c = sqrt (s * (s - a) * (s - b) * (s - c))
    where
        s = (a + b + c) / 2


-- Ejercicio 1.J
quadrant :: (Float, Float) -> Int
quadrant (x, y)
    | x > 0 && y > 0 = 1
    | x < 0 && y > 0 = 2
    | x < 0 && y < 0 = 3
    | x > 0 && y < 0 = 4


-- Ejercicio 1.K
igualesTres :: Eq a => a -> a -> a -> Bool
igualesTres x y z = x == y && y == z


-- Ejercicio 1.L
diferentesTres :: Eq a => a -> a -> a -> Bool
diferentesTres x y z = x /= y && y /= z && x /= z


-- Ejercicio 1.M
igualesCuatro :: Eq a => a -> a -> a -> a -> Bool
igualesCuatro a b c d = a == b && igualesTres b c d


-- Ejercicio 1.N
roots :: Float -> Float -> Float -> (Float, Float)
roots a b c = (v - d, v + d)
    where
        v = -b / (2*a)
        d = (sqrt (b^2 - 4*a*c)) / (2*a)


-- Ejercicio 1.Ñ
bisiesto :: Int -> Bool
bisiesto a = (mod a 4 == 0) && ((mod a 100 /= 0) || (mod a 400 == 0))


-- Ejercicio 1.O
xor :: Bool -> Bool -> Bool
xor x y = (x && not y) || (not x && y)


-- Ejercicio 2.A
divisores :: Int -> [Int]
divisores x = reverse (filter (divisible_por x) (lista_posibles_divisores x))

divisible_por :: Int -> Int -> Bool
divisible_por x y = mod x y == 0

lista_posibles_divisores :: Int -> [Int]
lista_posibles_divisores x
    | x == 1 = [(-1), 1]
    | x > 1 = [(-x), x] ++ lista_posibles_divisores (x-1)
    | x < -1 = [(-x), x] ++ lista_posibles_divisores (x+1)


-- Ejercicio 2.B
horas_minutos_segundos :: Int -> [Int]
horas_minutos_segundos x = [h, m, s]
    where
        h = x `div` 3600
        m = (x `mod` 3600) `div` 60
        s = x `mod` 60


-- Ejercicio 2.C
primo :: Int -> Bool
primo x = divisores x == [1, (-1), x, (-x)]


-- Ejercicio 2.D
nPrimes :: Int -> [Int]
nPrimes x = filter primo [1 .. x]


-- Ejercicio 2.E
tomar :: Int -> [a] -> [a]
tomar _ [] = []
tomar n (x:xs)
    | n == 0 = []
    | n > 0 = [x] ++ (tomar (n-1) xs)


-- Ejercicio 2.F
tomarMientras :: (a -> Bool) -> [a] -> [a]
tomarMientras p (x:xs)
    | p x = [x] ++ tomarMientras p xs
    | otherwise = []


-- Ejercicio 2.G
nIndex :: [a] -> Int -> a
nIndex (x:xs) n
    | n == 0 = x
    | n > 0 && n < length (x:xs) = nIndex xs (n-1)


-- Ejercicio 2.H
elem' :: Eq a => a -> [a] -> Bool
elem' _ [] = False
elem' e (x:xs)
    | x == e = True
    | otherwise = elem' e xs


-- Ejercicio 2.I
dec2bin :: Int -> [Int]
dec2bin x
    | x `div` 2 == 0 = []
    | otherwise = dec2bin (x `div` 2) ++ [x `mod` 2]

