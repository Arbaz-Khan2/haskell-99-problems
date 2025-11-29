-- Start of Problem 4

{-
Problem Description: Given a list of elements (e.g., numbers, characters), find the number of elements in the list (i.e., its length). For example:
Input: [1, 2, 3, 4] → Output: 4
Input: ['x', 'y', 'z'] → Output: 3
Input: [] → Output: 0
-}

{-
Pseudocode:
set counter = 0
for each element in list
    increment counter
return counter
-}

-- Solution 1: Simple Recursion
myLength :: [a] -> Int
myLength [] = 0
myLength (_ : xs) = 1 + myLength xs

{-
How it works:
Empty list ([]) returns 0.
For a list with head _ (ignored) and tail xs, return 1 (for the head) plus the length of xs.
Pros: Simple, intuitive, teaches recursive thinking.
-}

-- Solution 2: Mapping to 1 and Summing
myLength' :: [a] -> Int
myLength' xs = sum (map (const 1) xs)

{-
How it works:
map (const 1) xs transforms each element in xs to 1, producing a list of 1s (e.g., [1, 2, 3] -> [1, 1, 1]).
sum adds all elements in the resulting list (e.g., [1, 1, 1] -> 3).
For an empty list, map produces [], and sum [] returns 0.
Pros: Introduces map and sum, key functional concepts; intuitive as "counting ones".
Cons: Less direct than recursion; requires understanding map and sum.
map:
- Applies a function to each element in a list.
- For example, map (const 1) [1, 2, 3] produces [1, 1, 1].
const 1:
- A function that ignores its input and always returns 1.
sum:
- Takes a list of numbers and returns their sum.

-}

-- Solution 3: Using Library Function (length)
myLength'' :: [a] -> Int
myLength'' = length

{-
How it works:
Uses Haskell's standard library length function, which counts elements.
Pros: Concise, optimized, standard.
Cons: Doesn't teach recursion; hides implementation details.
-}

-- End of Problem 4
