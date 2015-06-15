show $ Point 1.0 1.0

--parse a value at run time
data Point = Point Double Double deriving (Show, Read)

reads "Point 1 2 and some extra stuff" :: [(Point, String)]
--[(Point 1.0 2.0," and some extra stuff")]

reads "(Point 1 2)" :: [(Point, String)] -- note parens OK


