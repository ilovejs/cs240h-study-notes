--http://www.scs.stanford.edu/14sp-cs240h/slides/basics-slides.html#(23)

parseMove :: String -> Maybe Move
parseMove str = case reads str of [(m, "")] -> Just m
                                  _         -> Nothing

--directly match:
--Note how strings are constructors---you can pattern match on them
parseMove :: String -> Maybe Move
parseMove "Rock"     = Just Rock
parseMove "Paper"    = Just Paper
parseMove "Scissors" = Just Scissors
parseMove _          = Nothing


