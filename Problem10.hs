-- Start of Problem 10

{-
Problem Description: Given a list of elements (e.g., numbers, characters), perform run-length encoding by replacing consecutive duplicates with a pair (n, x), where n is the number of occurrences and x is the element. For example:
Input: [1, 1, 1, 2, 3, 3, 2] → Output: [(3, 1), (1, 2), (2, 3), (1, 2)]
Input: ['a', 'a', 'b', 'b', 'a'] → Output: [(2, 'a'), (2, 'b'), (1, 'a')]
Input: [] → Output: []
Input: [1] → Output: [(1, 1)]
-}

{-
Pseudocode:
create empty result list
set current_count = 0
set previous = none
for each element in list
    if element == previous
        increment current_count
    else
        if current_count > 0
            append (current_count, previous) to result
        set current_count = 1
        set previous = element
if current_count > 0
    append (current_count, previous) to result
return result list
-}

-- Using pack from Problem 9
pack :: (Eq a) => [a] -> [[a]]
pack [] = []
pack [x] = [[x]]
pack (x : xs) =
  let (firstGroup, rest) = span (== x) (x : xs)
   in firstGroup : pack rest

-- Solution 1: Using Pack from Problem 9
encode :: (Eq a) => [a] -> [(Int, a)]
encode xs = map (\group -> (length group, head group)) (pack xs)

{-
How it works:
Uses pack from Problem 9 to group duplicates (e.g., [1, 1, 2] -> [[1, 1], [2]]).
Maps each group to (length group, head group) (e.g., [(2, 1), (1, 2)]).
Example: encode [1, 1, 2] -> pack [1, 1, 2] = [[1, 1], [2]] -> [(2, 1), (1, 2)].
Pros: Concise, reuses Problem 9; leverages mapping (like Problem 4).
Cons: Depends on pack; less educational if pack is not understood.
-}

-- Solution 2: Recursive Pattern Matching
encode' :: (Eq a) => [a] -> [(Int, a)]
encode' [] = []
encode' (x : xs) =
  let (count, rest) = countRun x 1 xs
   in (count, x) : encode' rest
  where
    countRun x n [] = (n, [])
    countRun x n (y : ys)
      | x == y = countRun x (n + 1) ys
      | otherwise = (n, y : ys)

{-
How it works:
Empty list ([]) returns [].
For x:xs, countRun counts consecutive x's, returns count and remaining list.
Prepend (count, x) to encoding of rest.
Example: encode' [1, 1, 2] -> countRun 1 1 [1, 2] = (2, [2]) -> (2, 1) : encode' [2] -> [(2, 1), (1, 2)].
Pros: Explicit, teaches recursive counting.
Cons: Not tail-recursive; requires helper function.
-}

-- Solution 3: Accumulator-Based Recursion
encode'' :: (Eq a) => [a] -> [(Int, a)]
encode'' xs = reverse (encodeAcc xs Nothing 0 [])
  where
    encodeAcc [] (Just x) n acc = (n, x) : acc
    encodeAcc [] Nothing _ acc = acc
    encodeAcc (x : xs) Nothing _ acc = encodeAcc xs (Just x) 1 acc
    encodeAcc (x : xs) (Just y) n acc
      | x == y = encodeAcc xs (Just y) (n + 1) acc
      | otherwise = encodeAcc xs (Just x) 1 ((n, y) : acc)

{-
How it works:
Uses encodeAcc with current (Maybe a), n (count), and acc (result).
For [], add (n, x) to acc if current exists.
For x:xs with no current, start counting x.
For x:xs with current y, if x == y, increment n; else, add (n, y) to acc and start x.
Reverse acc at end.
Example: encode'' [1, 1, 2] -> encodeAcc [1, 1, 2] Nothing 0 [] -> encodeAcc [2] (Just 1) 2 [] -> encodeAcc [] (Just 2) 1 [(2, 1)] -> reverse [(1, 2), (2, 1)] -> [(2, 1), (1, 2)].
Pros: Tail-recursive, efficient (O(n) with reverse).
Cons: Complex; requires reverse.
-}

-- End of Problem 10
