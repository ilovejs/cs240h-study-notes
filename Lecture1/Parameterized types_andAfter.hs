--参数化类型
--Parameterized types 'Function-like type'
data Maybe a = Just a
			 | Nothing

data Either a b = Left a
			    | Right b
-- Prelude> :t Just True
-- Just True :: Maybe Bool
-- Prelude> :t Left True
-- Left True :: Either Bool b 

-- Notice the type of Left True contains a type variable, b
-- Expression Left True can be of type Either Bool b for any type b
-- This is an example of a feature called parametric polymorphism

--deconstruction tips
isJust :: Maybe a -> Bool
isJust (Just _) = True
isJust Nothing  = False

isRed Red = True
isRed _	  = False

--deconstruct types and bind variables within guards
addMaybes mx my | Just x <- mx, Just y <- my = Just (x + y)
addMaybes _ _							     = Nothing

--simple way
addMaybes (Just x) (Just y) = Just (x + y)
addMaybes _ _				= Nothing


