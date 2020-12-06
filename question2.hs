

mySort::[Double]->[Double]
mySort a = foldr mySortHelp [] a

mySortHelp :: Double -> [Double] -> [Double]
mySortHelp x y = [lb | lb <- y, lb< x] ++ [x] ++ [la |la <-y, la>= x]



-- merge :: [Double] -> [Double] -> [Double]
-- merge [] ys = ys
-- merge (x:xs) ys = x:merge ys xs
