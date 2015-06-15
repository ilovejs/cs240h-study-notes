main = 
	data List a  = Cons a (List a) | Nil

	oneTwoThree = (Cons 1 (Cons 2 (Cons 3 Nil))) :: List Integer

	oneTwoThree = 1:2:3:[]	:: [Integer]

	--even more convenient
	oneTwoThree' = [1,2,3]	 --comma seperate
	oneTwoThree' = [1..3]    --range

	--string is just
	['a', 'b', 'c'] == "abc"

	head :: [a] -> a
	head (x:_) = x
	head []	   = error "head: empty list"

	tail :: [a] -> [a]		--tall but first element
	tail (_:xs)	= xs
	tail []     = error "tail: empty list"


	--why ??
	a ++ b  ::  [a] -> [a] -> [a]		--infix operator
	[] ++ ys	 = ys
	(x:xs) ++ ys = x: xs ++ ys

	length	:: [a] -> Int
	length  []	  = 0
	length	(_:l) = 1 + length l

	filter	:: (a -> Bool) -> [a] -> [a]
	filter	pred [] = []
	filter  pred (x:xs) 
		|	pred x  	=  x : filter pred xs
		|	otherwise	= filter pred xs



