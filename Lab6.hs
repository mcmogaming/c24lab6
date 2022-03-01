module Lab6 where

-- Translate the following Scheme expressions into Haskell.

-- (define life 42)
life = 42
-- (define life' (+ 42 24)) This is infix operator
life' = 42 + 24 
-- assert the types of life and life'
life :: Integer
life' :: Integer
-- (define (implies a b) (if a b True))
-- assert the type of implies
implies(a,b) = if a then b else True
implies :: (Bool, Bool) -> Bool

-- (define (greet x) (string-append "hello, " x))
-- assert the type of greet

great x = "hello" ++ x
great :: [Char] -> [Char]

-- define a function repeatTwice that repeats each element in the given list twice
-- assert the type of repeatTwice

repeatTwice [] = []
repeatTwice (x:xs) = x:x:repeatTwice(xs)
repeatTwice:: [a] -> [a] 

-- let's look at a better way! (listen to your TA!)

-- now let's use pattern matching to produce a much better solution
-- call it repeatTwice'
-- assert the type of repeatTwice'


repeatTwiceHelper' [] [] = []
repeatTwiceHelper' (x:xs) acc =
    if null xs 
        then acc:x:x
        else repeatTwiceHelper' xs acc:x

repeatTwice' list = repeatTwiceHelper' list []

-- define len (length of list) using pattern matching
-- what is the type of len? 

len [] = 0
len (x:xs) = 1 + len(xs)


-- define firsts that takes a list of pairs and returns a list of its first elements
-- use pattern mathing
-- what is the type of firsts?

firsts [] = []
firsts (x:xs) = fst(x):firsts(xs)

-- define rev which returns the reverse of the input list
-- use pattern matching
-- what is the type of reverse?

rev [] = []
rev (x:xs) = rev(xs):x

-- now define a tail-recursive linear-time version of rev called rev'
-- you can use "let" or "where": look them up! https://wiki.haskell.org/Let_vs._Where

rev' (x:xs) acc = 
    if null xs
    then x:acc
    else rev (tail xs) (x:acc)


main = do
  print "Lab 6"
  -- print $ greet "Anya"
  -- print $ repeatTwice' "cscc24"