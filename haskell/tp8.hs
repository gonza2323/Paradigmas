import Data.Char (ord)


-- Ejercicio 1.A Volumen de una esfera
sphereVolume :: Float -> Float
sphereVolume radius = (4/3) * pi * radius^3


-- Ejercicio 1.B
sumCoins :: Int -> Int -> Int -> Int -> Int -> Float
sumCoins a b c d e =
    0.01 * fromIntegral a
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
fourthPower x = (square.square) x


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
divisores x = filter (\y -> x `mod` y == 0) (lista_posibles_divisores x)

divisible_por :: Int -> Int -> Bool
divisible_por x y = mod x y == 0

lista_posibles_divisores :: Int -> [Int]
lista_posibles_divisores n = [ x | i <- [1 .. abs n], x <- [i, -i] ]


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
nPrimes n = filter primo [1 .. n]


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
    | x `div` 2 == 0 = [x `mod` 2]
    | otherwise = (dec2bin (x `div` 2)) ++ [x `mod` 2]


-- Ejercicio 2.J
data Complex = Complex Float Float deriving(Show)

addComplex :: Complex -> Complex -> Complex
addComplex (Complex a b) (Complex c d) = Complex (a+c) (b+d)

multComplex :: Complex -> Complex -> Complex
multComplex (Complex a b) (Complex c d) = Complex (a*c - b*d) (a*d + b*c)


-- Ejercicio 2.M
ocurrencias :: Eq a => a -> [a] -> Int
ocurrencias _ [] = 0
ocurrencias e (x:xs)
    | e == x = 1 + (ocurrencias e xs)
    | otherwise = ocurrencias e xs


-- Ejercicio 2.N
permutaciones :: Eq a => [a] -> [[a]]
permutaciones [] = [[]]
permutaciones xs = [ x:yx | x <- xs, yx <- permutaciones (remover x xs) ]

remover :: Eq a => a -> [a] -> [a]
remover e xs = filter (\x -> x /= e) xs


-- Ejercicio 2.Ñ
range :: Int -> Int -> [Int]
range m n = [m .. n]


-- Ejercicio 2.O
choose :: Int -> [a] -> [[a]]
choose 0 _ = [[]]
choose k (x:xs)
    | k == length (x:xs) = [(x:xs)]
    | k < length (x:xs) = chooseX ++ dontChooseX
        where
            chooseX = map (\ys -> x:ys) (choose (k-1) xs)
            dontChooseX = choose k xs


-- Ejercicio 2.P
mapToSuccesor :: [Int] -> [Int]
mapToSuccesor = map ((+) 1)


-- Ejercicio 2.Q
filtrarPositivos :: [Int] -> [Int]
filtrarPositivos = filter (0 <)


-- Ejercicio 2.R
reversa :: [Int] -> [Int]
reversa xs = foldl (\ys y -> y:ys) [] xs


-- Ejercicio 3.A
sumaPar :: Num a => [(a,a)] -> [a]
sumaPar = map (\(x, y) -> x + y)


-- Ejercicio 3.B
zipMaximos :: [Int] -> [Int] -> [Int]
zipMaximos = zipWith max


-- Ejercicio 3.C
zipSort :: [Int] -> [Int] -> [(Int, Int)]
zipSort = zipWith (\x y -> if x < y then (x,y) else (y,x))


-- Ejercicio 3.D
data Persona = Persona {
    nombre :: String,
    apellido :: String,
    fechaDeNacimiento :: Date
} deriving(Show, Eq)

data Date = Date {
    dia :: Int,
    mes :: Int,
    anio :: Int
} deriving(Show, Eq)

instance Ord Date where
    compare (Date d1 m1 a1) (Date d2 m2 a2) =
        case compare a1 a2 of
            EQ -> case compare m1 m2 of
                EQ -> compare d1 d2
                order -> order
            order -> order

takePersonas :: [Persona] -> Date -> [Persona]
takePersonas ps d = takeWhile (\p -> fechaDeNacimiento p < d) ps


-- Ejercicio 3.E
data Pizza = Pizza {
    ingredientes :: [String],
    precio :: Float
}

dropPrecio :: [Pizza] -> [Pizza]
dropPrecio ps = dropWhile (\p -> precio p <= 200) ps


-- Ejercicio 3.F
-- No se entiende


-- Ejercicio 3.G
-- No se entiende


-- Ejercicio 3.H
-- No se entiende


-- Ejercicio 3.I
-- No se entiende


-- Ejercicio 4.A
-- suma :: Num a => [a] -> p
suma [] = 0
suma (x:xs) = x + suma xs


-- Ejercicio 4.B
-- todos :: [Bool] -> Bool
alguno [] = False
alguno (x:xs) = x || alguno xs


-- Ejercicio 4.C
-- todos :: [Bool] -> Bool
todos [] = True
todos (x:xs) = x && todos xs


-- Ejercicio 4.D
-- codigos :: [Char] -> [Int]
codigos [] = []
codigos (x:xs) = ord x : codigos xs


-- Ejercicio 4.E
-- restos :: Integral a => a -> [a] -> [a]
restos _ [] = []
restos d (x:xs) = (mod x d) : (restos d xs)


-- Ejercicio 4.F
incrementarLista [] = []
incrementarLista (x:xs) = (x+1) : incrementarLista xs


-- Ejercicio 4.G
cuadrados [] = []
cuadrados (x:xs) = (x^2) : cuadrados xs


-- Ejercicio 4.H
longitudes [] = []
longitudes (x:xs) = (longitud x) : longitudes xs

longitud [] = 0
longitud (x:xs) = 1 + longitud xs


-- Ejercicio 4.I
orden [] = []
orden ((x,y):xs)
    | x < 3*y = (x,y) : orden xs
    | otherwise = orden xs


-- Ejercicio 4.J
pares [] = []
pares (x:xs)
    | mod x 2 == 0 = x : pares xs
    | otherwise = pares xs


-- Ejercicio 4.K
letras [] = []
letras (x:xs)
    | ('a' <= x && x <= 'z') || ('A' <= x && x <= 'Z') = x : letras xs
    | otherwise = letras xs


