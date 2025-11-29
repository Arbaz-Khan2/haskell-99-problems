-- Start of Problem 7

{-
Problem Description: Given a nested list structure (where elements can be single elements or lists), transform it into a flat list containing all elements in order. For example:
Input: [1, [2, [3, 4], 5]] → Output: [1, 2, 3, 4, 5]
Input: ['a', ['b', ['c']]] → Output: ['a', 'b', 'c']
Input: [] → Output: []
Input: [[1], [2]] → Output: [1, 2]
-}

{-
Pseudocode:
create empty result list
for each element in input list
    if element is a single value
        append element to result
    else if element is a list
        append flattened element to result
return result list
-}

-- Custom data type for nested lists
data NestedList a = Elem a | List [NestedList a]

{-
Data Structure:
Elem a: A single element of type a.
List [NestedList a]: A list of nested list elements (which can be Elem or List).
Example: [1, [2, [3, 4], 5]] is represented as List [Elem 1, List [Elem 2, List [Elem 3, Elem 4], Elem 5]].
-}

-- Solution 1: Recursive Pattern Matching
flatten :: NestedList a -> [a]
flatten (Elem x) = [x]
flatten (List []) = []
flatten (List (x : xs)) = flatten x ++ flatten (List xs)

{-
How it works:
For Elem x, return [x].
For empty List [], return [].
For List (x:xs), flatten x (Elem or List) and concatenate with flattened List xs.
Example: flatten (List [Elem 1, List [Elem 2]]) -> [1] ++ [2] -> [1, 2].
Pros: Intuitive, follows data structure's recursion.
Cons: Inefficient (O(n^2) due to ++).
-}

-- Solution 2: Accumulator-Based Recursion
flatten' :: NestedList a -> [a]
flatten' xs = flattenAcc xs []
  where
    flattenAcc (Elem x) acc = x : acc
    flattenAcc (List []) acc = acc
    flattenAcc (List (x : xs)) acc = flattenAcc x (flattenAcc (List xs) acc)

{-
How it works:
Uses helper function flattenAcc with accumulator to build list efficiently.
For Elem x, prepend x to acc.
For List [], return acc.
For List (x:xs), flatten x into acc, then flatten List xs.
Example: flatten' (List [Elem 1, List [Elem 2]]) -> 1 : (2 : []) -> [1, 2].
Pros: Efficient (O(n) due to O(1) prepends); teaches accumulators.
Cons: More complex due to nested recursion.
-}

-- Solution 3: Using ConcatMap
flatten'' :: NestedList a -> [a]
flatten'' (Elem x) = [x]
flatten'' (List xs) = concatMap flatten'' xs

{-
How it works:
For Elem x, return [x].
For List xs, use concatMap to flatten each element and concatenate results.
Example: flatten'' (List [Elem 1, List [Elem 2]]) -> [1] ++ [2] -> [1, 2].
Pros: Functional, uses concatMap; concise.
Cons: O(n²) due to concatenation; requires understanding concatMap.
concatMap:
- Applies a function to each element in a list and concatenates the results.
- For example, concatMap flatten'' [Elem 1, List [Elem 2]] produces [1] ++ [2].

-}

-- End of Problem 7
