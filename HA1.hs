zoom :: Num a => a -> [a]
zoom x = iterate (+ 1) x

partA :: [Int]
partA = filter m1 (zoom 1)

m1 :: Int -> Bool
m1 x = (mod x 2) == 0

partA_2 :: [Int]
partA_2 = iterate (+ 2) 2

partB :: [Int] -> [Int]
partB x = filter m2 (map ((*) 2) x)

m2 x = (x > 0)

partBF :: [Int] -> [Int]
partBF = foldr bf []

bf x ys
  | x > 0 = (2*x):ys
  | otherwise = ys

partC :: Double -> Double -> [Double]
partC n first  = iterate (guess n) first

guess :: Double -> Double -> Double
guess n x = (x + n/x) / 2

partD :: [Double] -> Double -> Double
partD (y:ys) x = second ( take 1 (filter (m3 x) (zip (y:ys) ys)))

second :: [(a,b)] -> b
second [(x,y)] = y

m3 :: Double -> (Double, Double) -> Bool
m3 x (a,b) = (abs (a-b)) < x

partE :: Double -> Double -> Double
partE x t = partD (partC x 1) t

partF :: [a->b] -> [a] -> [b]
partF funcs args = map combine (zip funcs args)

combine :: ((a->b),a) -> b
combine (f, x) = f x

partG :: [a->b] -> a -> [b]
partG funcs x = partF funcs (repeat x)

partH:: Eq a => a -> [a] -> [a]
partH remove from = filter (m4 remove) from

m4 :: Eq a => a -> a -> Bool
m4 remove x = remove /= x

partI :: Eq a => [a] -> [a] -> [a]
partI removes list = (foldr1 (.) (map partH removes)) list

partJ :: [a] -> [[a]]
partJ list = foldr prefix [[]] list

prefix :: a -> [[a]] -> [[a]]
prefix x list = [[]] ++ map (add x) list

add :: a -> [a] -> [a]
add x y = x:y

partK :: [a] -> [[a]]
partK list = foldr power [[]] list

power :: a -> [[a]] -> [[a]]
power x list = list ++ map (add x) list

----

mySort :: Ord a => [a] -> [a]
mySort l = foldr (sortHelper) [] l

sortHelper :: Ord a => a -> [a] -> [a]
sortHelper v l = foldr (sortHelper2) [v] l

sortHelper2 :: Ord a => a -> [a] -> [a]
sortHelper2 v (l:ls)
  | v < l = (v:l:ls)
  | otherwise = (l:v:ls)


-----

testSet :: [[[Char]]]
testSet = [["the","cat","the"], ["cat","hat","hat"], ["one", "two", "two"], ["three", "one", "two"]]

zoomUp x = iterate ((+) 1) 1

zipPages x = zip (zoomUp 1) x

distNums x = map distNum x

distNum (n, l) = map (pair n) l

pair n x = (x, n)

ccat x = foldr (++) [] x

step = mySort (ccat (distNums (zipPages testSet)))

step2 = foldr remDup [] step

remDup x [] = [x]
remDup y (x:xs)
  | x==y = x:xs
  | otherwise =  y:x:xs


step3 = map enclose step2

enclose (x,y) = (x,[y])

step4 = foldr combine2 [] step3

combine2 x [] = [x]
combine2 (x,p1) ((y,p2):xs)
  | x == y = (x,p1++p2):xs
  | otherwise = (x,p1):(y,p2):xs

remdups:: Eq a =>[a]->[a]->[a]
remdups x y = foldr remdupsHelp x y

remdupsHelp ::Eq a => a ->[a] ->[a]
remdupsHelp x y = filter (/=x) y
