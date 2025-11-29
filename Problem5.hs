-- Start of Problem 5

{-
Problem Description: Given a list of elements (e.g., numbers, characters), return a new list with the elements in reverse order. For example:
Input: [1, 2, 3, 4] → Output: [4, 3, 2, 1]
Input: ['x', 'y', 'z'] → Output: ['z', 'y', 'x']
Input: [] → Output: []
Input: [1] → Output: [1]
-}

{-
Pseudocode:
create empty result list
for each element in input list from end to start
    add element to result list
return result list
-}

-- Solution 1: Naive Recursion with Append
myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x : xs) = myReverse xs ++ [x]

{-
How it works:
Empty list ([]) returns [].
For x : xs, reverse xs and append [x] to the end.
Example: myReverse [1, 2, 3] -> myReverse [2, 3] ++ [1] -> ([3] ++ [2]) ++ [1] -> [3, 2, 1].
Pros: Simple, mirrors intuitive reversing.
Cons: Inefficient (O(n^2) due to repeated ++ operations).
-}

-- Solution 2: Accumulator-Based Recursion
myReverse' :: [a] -> [a]
myReverse' xs = reverseAcc xs []
  where
    reverseAcc [] acc = acc
    reverseAcc (x : xs) acc = reverseAcc xs (x : acc)

{-
How it works:
Uses a helper function reverseAcc with an accumulator acc to build the reversed list.
For [], return the accumulator.
For x : xs, prepend x to acc and recurse on xs.
Example: myReverse' [1, 2, 3] -> reverseAcc [1, 2, 3] [] -> reverseAcc [2, 3] [1] -> reverseAcc [3] [2, 1] -> reverseAcc [] [3, 2, 1] -> [3, 2, 1].
Pros: Efficient (O(n) due to O(1) prepends); introduces tail recursion and accumulators.
Cons: More complex due to helper function.
-}

-- Solution 3: Using Library Function (reverse)
myReverse'' :: [a] -> [a]
myReverse'' = reverse

{-
How it works:
Uses Haskell’s standard library reverse function, which efficiently reverses a list.
Pros: Concise, optimized (O(n)), standard.
Cons: Hides implementation details; less educational.
-}

-- End of Problem 5
