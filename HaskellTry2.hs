-- taking in an integer and returning a String
classify :: Int -> String
classify 0 = "zero"
classify x
  | x > 0 = "positive"
  | otherwise = "negative"

-- taking in and integer and a defined funtion ans returning a string
classifyMap1 :: [Int] -> (Int -> String) -> [String]
classifyMap1 [] f = []
classifyMap1 (x : xs) f = (f x) : (classifyMap1 xs f)

-- allowing the program to do the recursion for me in
classifyMap2 :: [Int] -> [String]
classifyMap2 x = map classify x

-- Bacwards Recursion Example:
product1 :: [Int] -> Int
product1 [] = 1
product1 (x : xs) = x * (product1 xs)

-- Helper Function
productive :: [Int] -> Int
productive[] y = y
productive(x :xs) y =
-- Forward Recursion Example:
product2 :: [Int] -> Int -> Int
product2 [] first = first
product2 (x : xs) first = product2(xs) (first * x)

-- Forward Recursion foldr Example:
product3 :: [Int] -> Int
product3 list = foldr (*) 1 list
