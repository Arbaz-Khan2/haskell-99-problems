# Haskell 99 Problems - Solutions

A comprehensive collection of solutions to the famous "99 Haskell Problems" - a set of exercises designed to improve functional programming skills in Haskell.

## 📖 About

The [99 Haskell Problems](https://wiki.haskell.org/H-99:_Ninety-Nine_Haskell_Problems) are a series of programming challenges ranging from basic list manipulation to complex algorithms. These problems are inspired by the "99 Prolog Problems" and serve as an excellent resource for learning functional programming concepts.

## 🎯 Features

- **Multiple Solution Approaches**: Each problem includes 2-3 different implementations
- **Detailed Explanations**: Comprehensive comments explaining how each solution works
- **Progressive Difficulty**: Problems are organized from beginner to advanced level
- **Best Practices**: Solutions demonstrate idiomatic Haskell patterns and techniques

## 📁 Repository Structure

```
.
├── Problem1.hs   # Find the last element of a list
├── Problem2.hs   # Find the second-to-last element of a list
├── Problem3.hs   # Find the k-th element of a list
├── Problem4.hs   # Find the number of elements in a list
├── Problem5.hs   # Reverse a list
├── Problem6.hs   # Check if a list is a palindrome
├── Problem7.hs   # Flatten a nested list structure
├── Problem8.hs   # Eliminate consecutive duplicates
├── Problem9.hs   # Pack consecutive duplicates into sublists
└── Problem10.hs  # Run-length encoding of a list
```

## 🚀 Getting Started

### Prerequisites

- [GHC (Glasgow Haskell Compiler)](https://www.haskell.org/ghc/) installed on your system
- Or use [GHCi](https://downloads.haskell.org/~ghc/latest/docs/html/users_guide/ghci.html) (interactive Haskell interpreter)

### Running the Solutions

#### Using GHCi (Interactive Mode)

```bash
# Load a problem file
ghci Problem1.hs

# Test the functions
*Main> myLast [1, 2, 3, 4]
4

*Main> myLast' [1, 2, 3, 4]
Just 4
```

#### Compiling and Running

```bash
# Compile a problem file
ghc Problem1.hs

# Run the compiled program
./Problem1
```

## 📚 Problem Categories

### Lists (Problems 1-10) ✅
Working with list operations, recursion, and basic functional patterns.

- [x] Problem 1 - Last element
- [x] Problem 2 - Second-to-last element
- [x] Problem 3 - K-th element
- [x] Problem 4 - Length of list
- [x] Problem 5 - Reverse list
- [x] Problem 6 - Palindrome check
- [x] Problem 7 - Flatten nested lists
- [x] Problem 8 - Remove duplicates
- [x] Problem 9 - Pack duplicates
- [x] Problem 10 - Run-length encoding

### Future Categories
- Lists continued (Problems 11-28)
- Arithmetic (Problems 31-41)
- Logic and Codes (Problems 46-50)
- Binary Trees (Problems 54-69)
- Multiway Trees (Problems 70-73)
- Graphs (Problems 80-89)
- Miscellaneous (Problems 90-99)

## 💡 Solution Approaches

Each problem file typically contains three types of solutions:

1. **Recursive Approach**: Pure functional recursion demonstrating pattern matching
2. **Safe Version**: Using `Maybe` or other types for error handling
3. **Library Functions**: Leveraging Haskell's standard library when applicable

Example from Problem 1:
```haskell
-- Recursive
myLast :: [a] -> a
myLast [x] = x
myLast (_ : xs) = myLast xs

-- Safe with Maybe
myLast' :: [a] -> Maybe a
myLast' [] = Nothing
myLast' [x] = Just x
myLast' (_ : xs) = myLast' xs

-- Using built-in
myLast'' :: [a] -> a
myLast'' = last
```

## 🎓 Learning Resources

- [Haskell Wiki - 99 Problems](https://wiki.haskell.org/H-99:_Ninety-Nine_Haskell_Problems)
- [Learn You a Haskell](http://learnyouahaskell.com/)
- [Real World Haskell](http://book.realworldhaskell.org/)
- [Haskell Documentation](https://www.haskell.org/documentation/)

## 🤝 Contributing

Contributions are welcome! If you have:
- Alternative solutions
- Performance improvements
- Better explanations
- Bug fixes

Feel free to open an issue or submit a pull request.

## 🙏 Acknowledgments

- Original "99 Prolog Problems" by Werner Hett
- Haskell community for maintaining the problem set
- All contributors to functional programming education

---

**Note**: This is a work in progress. More problems will be added as solutions are developed.

⭐ If you find this repository helpful, please consider giving it a star!
