-- Start of Problem 2

{-
Problem Description: Given a list of elements (e.g., numbers, characters), find the second last element. For example:
Input: [1, 2, 3, 4] → Output: 3
Input: ['x', 'y', 'z'] → Output: 'y'
Input: [] → Output: (undefined or error, as there’s no second last element)
Input: [1] → Output: (undefined or error, as there’s no second last element)
-}

{-
Pseudocode:
if list is empty or has one element, return error
else traverse list until second-to-last element
return second-to-last element
-}

-- Solution 1: Simple Recursion
mySecondLast :: [a] -> a
mySecondLast [] = error "Empty list has no second last element"
mySecondLast [_] = error "List with one element has no second last element"
mySecondLast [x, _] = x
mySecondLast (_ : xs) = mySecondLast xs

{-
How it works:
Empty list ([]) throws an error.
Single-element list ([_]) throws an error.
Two-element list ([x, _]) returns x (second last).
Longer lists (_ : xs) recurse on the tail xs.
-}

-- Solution 2: Using Maybe for Safety
mySecondLast' :: [a] -> Maybe a
mySecondLast' [] = Nothing
mySecondLast' [_] = Nothing
mySecondLast' [x, _] = Just x
mySecondLast' (_ : xs) = mySecondLast' xs

{-
How it works:
How it works:
Same as Solution 1, but returns Nothing for invalid cases and Just x for the second last element.
Pros: Safer, idiomatic, forces the caller to handle edge cases.
Cons: Slightly more complex for beginners due to Maybe.
-}

-- Solution 3: Using Library Functions (last and init)
mySecondLast'' :: [a] -> a
mySecondLast'' xs
  | length xs < 2 = error "List must have at least two elements"
  | otherwise = last (init xs)

{-
How it works:
init xs returns all elements except the last (e.g., [1, 2, 3, 4] → [1, 2, 3]).
last on that result gives the second-to-last element (e.g., 3).
Checks length xs < 2 to handle edge cases.
-}

-- End of Problem 2
