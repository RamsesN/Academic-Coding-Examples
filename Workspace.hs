partC :: Double->Double->[Double]
partC a b = iterate (partCHelp a) b
-- Calculates the approximation
partCHelp :: Double -> Double -> Double
partCHelp a b = (a+b/a)/2



-- partEHelp :: Double -> Double -> Boolean
-- current problem is getting the previous element of the list being created
-- so that it can be used to calculate the stop condition; should be y

module Stack(top,next,push,pop,isEmpty)where
