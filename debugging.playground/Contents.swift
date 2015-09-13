//: # Homework 1 - Debugging and Swift Intro

//: To see markup format, go to Editor -> Show Rendered Markup


import UIKit


//: ## Q1: Optionals
//: The compiler is yelling at us. Why isn't this the correct way to unwrap optionals?

class Foo {
    
    var wordA : String!
    var wordB : String!
    
    init (words: [String?]) {
        wordA = words[0]
        wordB = words[1]
    }
    
//: The line "init (words: [String?]) {" already demonstrates that what is inside is in fact an optional. So defining words[0] and words[1] to be optionals as well is just repeating itself.
    

    
//: ## Q2: Variable Types and Function Types
//: Why does the compiler dislike the for loop? Also, what should we return?
    
    func arePalindromes(words: [String]) -> Bool! {
        let reversedWords = words.map() {String($0.characters.reverse())}
        let numElements = words.count
        
        for var i = 0; i < numElements; i++ {
            if words[i] != reversedWords[i] {
                return false
            }
        }
        
        return true
    }
    
//:    Let signifies that i will be a constant. However, on the same line, i is incremented thus the value is changed, breaking the promise that i is actually constant.
//:
//:    It should return true on the penultimate line.
    
    
//: ## Q3: More functions, and object initialization
//: The method should be returning true or false -- what's wrong?
//: Are we initializing the dictionary correctly?
    func isAnagram(wordA: String, wordB: String) -> Bool? {
        var countLetters : [Character : Int] = [:];
        let lenA = wordA.characters.count
        let lenB = wordB.characters.count
        
        if lenA != lenB {
            return false
        }
        var arrA = Array(wordA.characters)
        var arrB = Array(wordB.characters)
        
        for i in 0...lenA-1 {
            let letter = arrA[i]
            if let val = countLetters[letter] {
                countLetters[letter] = val + 1
            } else {
                countLetters[letter] = 1
            }
        }
        
        for i in 0...lenB-1 {
            let letter = arrB[i]
            if let val = countLetters[letter] {
                countLetters[letter] = val - 1
            } else {
                return false
            }
        }
        
        for (letter, count) in countLetters {
            if count != 0 {
                return false
            }
        }
        
        return true
    }
}

//: The problem here is that the dictionary is being defined, but it is never actually initialized. So when the playground attempts to access the pointer to an element in the dictionary, it runs into issues.


//: **Do not** change anything below.
//: You should be able to call the methods as is.
Foo.isAnagram("anagram", wordB: "managra")
Foo.isAnagram("hello", wordB: "what")

var palindromes = ["hih", "racecar", "mom", "wow"]
var notPalindromes = ["gene", "shawn", "hello"]
Foo.arePalindromes(palindromes)
Foo.arePalindromes(notPalindromes)

