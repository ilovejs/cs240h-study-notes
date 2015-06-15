--David Mazières, Bryan O'Sullivan, David Terei

--  | Bindings |
x = 2                   -- Two hyphens introduce a comment
x = 6                   -- error, cannot re-bind x
y = 3                   --    ...that continues to end of line.
main = let z = x + y    -- let introduces local bindings
       in print z       -- program will print 5

add arg1 arg2 = arg1 + arg2   -- defines function add
five = add 2 3                -- invokes function add

bad = print add 2 3     -- error! (print should have only 1 argument)

main = print (add 2 3)  -- ok, calls print with 1 argument, 5

--Haskell bindings are:
--1. immutable
--2. order-independent - order of bindings in source code does not matter
--3. lazy
--4. recursive - the bound symbol is in scope within its own definition

--here is piece for lazy
safeDiv x y =
    let q = div x y        -- safe as q never evaluated if y == 0
    in if y == 0 then 0 else q   --this happens first.
main = print (safeDiv 1 0) -- prints 0

--define itself
x = 5                 -- this x is not used in main

main = let x = x + 1  -- introduces new x, defined in terms of itself
       in print x     -- program "diverges" (i.e., loops forever)

-- c runs in constact space, no extra stack frame
long
factorial (int n)
{
  long result = 1;
  while (n > 1)
    result *= n--;
  return result;
}

--In Haskell, use recursion to "re-bind" argument symbols in new scope
factorial n = if n > 1
              then n * factorial (n-1)
              else 1

--参数累计器
--optimized version:
--situation if f(n) = n * f(n-1)
--use accumulator arg to make calls tail recursive
factorial n = let loop acc n' = if n' > 1
                								then loop (acc * n') (n' - 1)
                								else acc
			        in loop 1 n
--Here loop is tail recursive, compiles to an actual loop
--ps: how 'in' has been used in haskell ?

-- |Guars and where clauses |
--Guards are evaluated top to bottom; the first True guard wins
factorial n = let loop acc n' | n' > 1 = loop (acc * n') (n' - 1)
							                | otherwise = acc

			        in loop 1 n
--ps: The system Prelude (standard library) defines otherwise = True

--where clauses--like inverted let
factorial n = loop 1 n
		where loop acc n' | n' > 1 = loop (acc * n') (n' - 1)
						          | otherwise = acc
--http://www.scs.stanford.edu/14sp-cs240h/slides/basics-slides.html#(11)
--q??: Unlike let, a where clause scopes over multiple guarded definitions
--		  This is convenient for binding variables to use in guards

--Typical practice is to add ' (prime) to the inner-function's argument

--You can avoid the problem by using the longer symbol name for the outer function (i.e., shorter name for shorter scope)
factorial n0 = loop 1 n0
    where loop acc n | n > 1     = loop (acc * n) (n - 1)
                     | otherwise = acc

--Here accidentally typing "factorial n0 = loop 1 n" causes compile error

--Int - fixed-size integer
--Integer - an arbitrary-size integer

--type1 -> type2 - a function from type1 to type2
--(type1, type2, ..., typeN) - a tuple
--() - a zero-tuple, pronounced unit (kind of like void in C); there is only one value of this type, also written ()

x :: Integer
x = (1 :: Integer) + (1 :: Integer) :: Integer

--ps, :: has lower precedence than any function operators (including +)

-- | Currying
add :: Integer -> (Integer -> Integer)
add arg1 arg2 = arg1 + arg2

--So add 2 3 is equivalent to (add 2) 3
--(add 2) takes 3 returns 5, so (add 2) has type Integer -> Integer
---> associates to the right, so parens usually omitted in multi-argument function types:
--fn :: argType1 -> argType2 -> ... -> argTypeN -> resultType

--User-defined data types
-- user-defined data types (like struct in C):
data PointT = PointC Double Double deriving Show
--Can also derive Read, Eq, Ord, Enum, Bounded

--Types and constructors can use the same name (often do), E.g.:
data Point = Point Double Double deriving Show

--One type can have multiple constructors (like a tagged union):
data Point = Cartesian Double Double
           | Polar Double Double
             deriving Show

data Color = Red | Green | Blue | Violet deriving (Show, Eq, Enum)


--using Data Types
myPoint :: Point
myPoint = Point 1.0 1.0

data Color = Red | Green | Blue | Violet deriving (Show, Eq, Enum)
myColor :: Color
myColor = Red


getX, getMaxCoord :: Point -> Double

--case statements "de-construct" values with patterns
getX point = case point of
               Point x y -> x   --what is this sign?

--function bindings "de-construct" values with patterns
getMaxCoord (Point x y) | x > y     = x
                        | otherwise = y

isRed :: Color -> Bool
isRed Red = True			-- Only matches constructor Red
isRed c   = False










