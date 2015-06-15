import Data.Char    -- brings function isLower into scope

countLowerCase :: String -> Int
countLowerCase str = length (filter isLower str)

--So length will causes filter to produce Chars one at a time

--function composition
countLowerCase = length . filter isLower

(f . g) x = f (g x)

countLowercaseAndDigits = 
	length . filter (\c -> isLower c || isDigit c)

--TODO: Lambda abstractions can deconstruct values with patterns, e.g.:
... (\(Right x) -> x) ...

 