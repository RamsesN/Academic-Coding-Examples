-- PART A :
partA::[Int] -> [Int]
partA x = filter (partAHelp) x

partAHelp:: Int -> Bool
partAHelp x
 | mod x 2 == 0 && x>0 = True
 | otherwise = False

-- PART B :
partB::[Int] -> [Int]
partB x = map partBHelp2 (filter (partBHelp1) x)

partBHelp1 :: Int -> Bool
partBHelp1 x
 | x > 0 = True
 | otherwise = False

partBHelp2 :: Int -> Int
partBHelp2 x = x*2

-- PART C:
partC :: Double->Double->[Double]
partC a b = iterate (partCHelp a) b
-- Calculates the approximation
partCHelp :: Double -> Double -> Double
partCHelp a b = (a+b/a)/2

-- PART D:*
--absolute value of a previos number minus next number
partD :: [Double] -> Double -> Double
partD (xa:xb:xs) a
  |abs (xa - xb) <= a = partD ([xb]++xs) a
  |otherwise = xb

-- PART E:*
partE :: Double -> Double -> Double
partE a b = partD (partC a 1) b

-- PART F:
partF :: [b->a] -> [b] -> [a]
partF x y = map partFHelp (zip x y)

partFHelp :: (b->a,b)-> a
partFHelp (f,b) = f b

--PART G:
partG :: [b->a] -> b -> [a]
partG x y = map partFHelp (zip x (repeat y))

-- PART H:
partH :: Eq a => a -> [a] -> [a]
partH y x = filter (/=y) x

-- PART I:
partI ::Eq a=> [a]->[a]->[a]
partI x y = foldr partH y x

-- PART J:
partJ :: [a] -> [[a]]
partJ (x:xs) = [] : (map (x:) (partJ xs))
partJ [] = [[]]

-- PART K:
partK :: [a] -> [[a]]
partK  = foldr (\t a-> a ++ map (t:) a) [[]]

--partJHelp :: a -> a -> a
-- partJHelp a = a
-- partE a b = head (dropWhile (\x -> abs(x-y)>=b) (partC a 1))

-- returns if the
--partDHelp3 :: (Double,Double) ->Double -> Double
--partDHelp3 (xa,xb) a

--partDHelp1 :: [Double] -> [(Double, Double)]
--partDHelp1 x = zip (return1 x 0) (return1 x 1)

--return1 :: [Double] -> Double -> [Double]
--return1 x 0 = x
--return1 (x:xs) 1 = xs
