--struct
data Move = Rock | Paper | Scissors
     deriving (Eq, Read, Show, Enum, Bounded)
--struct
data Outcome = Lose | Tie | Win deriving (Show, Eq, Ord)

--outcome :: Move -> Move -> Outcome
outcome Rock Scissors   = Win
outcome Scissors Paper  = Win
outcome Paper Rock 		= Win
outcome us them | us == them = Tie
				| otherwise  = Lose

main = do
	print (outcome Rock Scissors)

