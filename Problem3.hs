-- Start of Problem 3

{-
Problem Description: Given a list of elements (e.g., numbers, characters) and an index k, find the element at the kth position. For example:
Input: [1, 2, 3, 4], k=3 → Output: 3
Input: ['x', 'y', 'z'], k=2 → Output: 'y'
Input: [], k=1 → Output: (undefined or error, as the list is empty)
Input: [1, 2], k=3 → Output: (undefined or error, as k is out of bounds)
Input: [1, 2], k=0 → Output: (undefined or error, as k must be positive)
-}

{-
Pseudocode:
if list is empty or k < 1 or k > length of list, return error
set counter = 1
traverse list until counter equals k
return element at that position
-}

-- Solution 1: Simple Recursion
elementAt :: [a] -> Int -> a
elementAt [] _ = error "Empty list or invalid index"
elementAt (x : _) 1 = x
elementAt (_ : xs) k
  | k < 1 = error "Index must be positive"
  | otherwise = elementAt xs (k - 1)

{-
How it works:
Empty list ([]) throws an error for any k.
For k=1, return the head x of the list.
For k < 1, throw an error (invalid index).
Otherwise, recurse on the tail xs with k-1.
-}

-- Solution 2: Using Maybe for Safety
elementAt' :: [a] -> Int -> Maybe a
elementAt' [] _ = Nothing
elementAt' (x : _) 1 = Just x
elementAt' (_ : xs) k
  | k < 1 = Nothing
  | otherwise = elementAt' xs (k - 1)

{-
How it works:
Same as Solution 1, but returns Nothing for invalid cases (empty list or k < 1) and Just x for the kth element.
Pros: Safer, idiomatic, encourages handling edge cases.
Cons: Requires understanding Maybe.
-}

-- Solution 3: Using Library Function (!!)
elementAt'' :: [a] -> Int -> a
elementAt'' xs k
  | k < 1 || k > length xs = error "Invalid index or empty list"
  | otherwise = xs !! (k - 1)

{-
How it works:
Checks if k < 1 or k > length xs to handle invalid cases.
Uses !! (Haskell’s indexing operator) with k-1 (since !! is 0-based, but problem uses 1-based indexing).
Example: [1, 2, 3, 4] !! 2 returns 3 (for k=3).
-}

-- End of Problem 3
