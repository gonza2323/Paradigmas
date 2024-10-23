
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

