-- Start of Problem 6

{-
Problem Description: Given a list of elements (e.g., numbers, characters), determine whether it is a palindrome, i.e., reads the same forward and backward. For example:
Input: [1, 2, 3, 2, 1] → Output: True
Input: ['a', 'b', 'b', 'a'] → Output: True
Input: [1, 2, 3] → Output: False
Input: [] → Output: True
Input: [1] → Output: True
-}

{-
Pseudocode:
if list is empty or has one element, return true
create reversed copy of list
compare original list with reversed list
if equal, return true, else false
-}

-- Solution 1: Using Reverse
isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome xs = xs == reverse xs

{-
How it works:
Compare the list xs with its reverse using ==.
Example: For [1, 2, 2, 1], reverse [1, 2, 2, 1] = [1, 2, 2, 1], so xs == reverse xs returns True.
Pros: Simple, intuitive, reuses reverse from Problem 5.
Cons: Inefficient (O(n) for reverse and ==); less educational for recursion.
-}

-- Solution 2: Recursive End Comparison
isPalindrome' :: (Eq a) => [a] -> Bool
isPalindrome' [] = True
isPalindrome' [_] = True
isPalindrome' xs = head xs == last xs && isPalindrome' (init (tail xs))

{-
How it works:
Empty list ([]) and single-element list ([_]) return True.
For longer lists, check if first (head xs) and last (last xs) elements are equal, recurse on middle (init (tail xs)).
Example: For [1, 2, 2, 1], check 1 == 1, recurse on [2, 2], check 2 == 2, recurse on [], return True.
Pros: Teaches recursion; avoids full list reversal.
Cons: Inefficient (O(n^2) due to last and init); requires careful edge case handling.
-}

-- Solution 3: Zipping with Reverse
isPalindrome'' :: (Eq a) => [a] -> Bool
isPalindrome'' xs = and (zipWith (==) xs (reverse xs))

{-
How it works:
zipWith (==) xs (reverse xs) pairs corresponding elements, checking equality (e.g., [1, 2, 2, 1] and [1, 2, 2, 1] -> [True, True, True, True]).
and returns True if all pairs are equal.
For odd-length lists, zipWith compares up to the middle.
Example: For [1, 2, 3], zipWith (==) [1, 2, 3] [3, 2, 1] = [False, True, False], and returns False.
Pros: Functional, uses zipWith and and declaratively.
Cons: Uses reverse (O(n)); requires understanding zipWith.
-}

-- End of Problem 6
