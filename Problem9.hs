-- Start of Problem 9

-- importing Data.List for the group function
import Data.List (group)

{-
Problem Description: Given a list of elements (e.g., numbers, characters), pack consecutive duplicate elements into sublists. For example:
Input: [1, 1, 1, 2, 3, 3, 2] → Output: [[1, 1, 1], [2], [3, 3], [2]]
Input: ['a', 'a', 'b', 'b', 'a'] → Output: [['a', 'a'], ['b', 'b'], ['a']]
Input: [] → Output: []
Input: [1] → Output: [[1]]
-}

{-
Pseudocode:
create empty result list
set current_group = empty
set previous = none
for each element in list
    if element == previous
        append element to current_group
    else
        if current_group is not empty
            append current_group to result
        set current_group = [element]
        set previous = element
if current_group is not empty
    append current_group to result
return result list
-}

-- Solution 1: Recursive Pattern Matching
pack :: (Eq a) => [a] -> [[a]]
pack [] = []
pack [x] = [[x]]
pack (x : xs) =
  let (firstGroup, rest) = span (== x) (x : xs)
   in firstGroup : pack rest

{-
How it works:
Empty list ([]) returns [].
Single-element list ([x]) returns [[x]].
For x:xs, use span (== x) to split into first group and rest, recurse on rest.
Example: pack [1, 1, 2] -> span (== 1) [1, 1, 2] = ([1, 1], [2]) -> [1, 1] : pack [2] -> [[1, 1], [2]].
Pros: Intuitive, uses span to group duplicates.
Cons: Not tail-recursive; span traverses list for each group.
-}

-- Solution 2: Accumulator-Based Recursion
pack' :: (Eq a) => [a] -> [[a]]
pack' xs = reverse (packAcc xs [] [])
  where
    packAcc [] current acc = if null current then acc else current : acc
    packAcc (x : xs) [] acc = packAcc xs [x] acc
    packAcc (x : xs) current@(y : _) acc
      | x == y = packAcc xs (x : current) acc
      | otherwise = packAcc xs [x] (current : acc)

{-
How it works:
Uses packAcc with current (group being built) and acc (completed groups).
For [], add current to acc if non-empty.
For x:xs with empty current, start new group [x].
For x:xs with current (y:_), if x == y, add x to current; else, move current to acc and start [x].
Reverse acc at end.
Example: pack' [1, 1, 2] -> packAcc [1, 1, 2] [] [] -> packAcc [1, 2] [1] [] -> packAcc [2] [1, 1] [] -> packAcc [] [2] [[1, 1]] -> reverse [[2], [1, 1]] -> [[1, 1], [2]].
Pros: Tail-recursive, efficient (O(n) with reverse).
Cons: Complex due to two accumulators; requires reverse.
-}

-- Solution 3: Using Group
pack'' :: (Eq a) => [a] -> [[a]]
pack'' = group

{-
How it works:
Uses group (from Data.List) to split list into sublists of consecutive equal elements.
Example: pack'' ['a', 'a', 'b'] -> group ['a', 'a', 'b'] -> [['a', 'a'], ['b']].
Pros: Concise, leverages group from Problem 8; optimized.
Cons: Requires Data.List import; hides details.
Note: Requires import Data.List for group.
-}

-- End of Problem 9
