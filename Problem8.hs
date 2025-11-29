-- Start of Problem 8

-- importing Data.List for the group function
import Data.List (group)

{-
Problem Description: Given a list of elements (e.g., numbers, characters), eliminate consecutive duplicate elements, keeping the first occurrence of each sequence. For example:
Input: [1, 1, 1, 2, 3, 3, 2] → Output: [1, 2, 3, 2]
Input: ['a', 'a', 'b', 'b', 'a'] → Output: ['a', 'b', 'a']
Input: [] → Output: []
Input: [1] → Output: [1]
-}

{-
Pseudocode:
create empty result list
set previous = none
for each element in list
    if element != previous
        append element to result
        set previous = element
return result list
-}

-- Solution 1: Recursive Pattern Matching
compress :: (Eq a) => [a] -> [a]
compress [] = []
compress [x] = [x]
compress (x : y : ys)
  | x == y = compress (y : ys)
  | otherwise = x : compress (y : ys)

{-
How it works:
Empty list ([]) returns [].
Single-element list ([x]) returns [x].
For x:y:ys, if x == y, skip x and recurse on y:ys; otherwise, keep x and recurse.
Example: compress [1, 1, 2] -> compress [1, 2] -> 1 : compress [2] -> [1, 2].
Pros: Intuitive, directly compares adjacent elements.
Cons: Not tail-recursive; requires pattern matching on two elements.
-}

-- Solution 2: Accumulator-Based Recursion
compress' :: (Eq a) => [a] -> [a]
compress' xs = reverse (compressAcc xs [])
  where
    compressAcc [] acc = acc
    compressAcc [x] acc = x : acc
    compressAcc (x : y : ys) acc
      | x == y = compressAcc (y : ys) acc
      | otherwise = compressAcc (y : ys) (x : acc)

{-
How it works:
Uses helper function compressAcc with accumulator.
For [], return acc.
For [x], prepend x to acc.
For x:y:ys, if x == y, skip x; otherwise, prepend x to acc.
Reverse acc at the end to restore order.
Example: compress' [1, 1, 2] -> compressAcc [1, 1, 2] [] -> compressAcc [1, 2] [] -> compressAcc [2] [1] -> [2, 1] -> reverse [2, 1] -> [1, 2].
Pros: Tail-recursive, efficient (O(n) with reverse).
Cons: Requires reverse at end; more complex.
-}

-- Solution 3: Using Group
compress'' :: (Eq a) => [a] -> [a]
compress'' = map head . group

{-
How it works:
group (from Data.List) splits list into sublists of consecutive equal elements (e.g., [1, 1, 2] -> [[1, 1], [2]]).
map head takes first element of each sublist (e.g., [1, 2]).
Example: compress'' ['a', 'a', 'b'] -> group ['a', 'a', 'b'] = [['a', 'a'], ['b']] -> map head = ['a', 'b'].
Pros: Concise, functional; leverages map (like Problem 4) and group.
Cons: Requires Data.List import; hides details.
Note: Requires import Data.List for group.
-}

-- End of Problem 8
