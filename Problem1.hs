-- Start of Problem 1

{-
Problem Description: Given a list of elements (e.g., numbers, characters), find the last element. For example:
Input: [1, 2, 3, 4] → Output: 4
Input: ['x', 'y', 'z'] → Output: 'z'
Input: [] → Output: (undefined or error, as there's no last element)
-}

{-
Pseudocode:
if list is empty, return error
else traverse list until the last element
return last element
-}

-- Solution 1: Simple Recursion
myLast :: [a] -> a
myLast [] = error "Empty list has no last element"
myLast [x] = x
myLast (_ : xs) = myLast xs

{-
How it works:
Base case: Empty list ([]) throws an error.
Base case: Single-element list [x] returns x.
Recursive case: For a list with head _ (ignored) and tail xs, recurse on xs.
-}

-- Solution 2: Using Maybe for Safety
myLast' :: [a] -> Maybe a
myLast' [] = Nothing
myLast' [x] = Just x
myLast' (_ : xs) = myLast' xs

{-
How it works:
Returns Nothing for empty lists, Just x for the last element.
Same recursive logic, but safer (avoids exceptions).
-}

-- Solution 3: Using Built-in Function
myLast'' :: [a] -> a
myLast'' = last

{-
How it works:
Haskell’s standard library last function does exactly this.
Pros: Concise, optimized, standard.
Cons: Doesn’t teach recursion; last throws an error on empty lists.
-}

-- End of Problem 1
