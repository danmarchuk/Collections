//
//  SetController.swift
//  Collections
//
//  Created by Данік on 05/03/2023.
//

import UIKit

class SetController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var firstTextField: UITextField!
    
    
    @IBOutlet weak var secondTextField: UITextField!
    
    @IBAction func allMatchingLettersButton(_ sender: UIButton) {
        var matchingChars = ""
        if let firstText = firstTextField.text {
            if let secondText = secondTextField.text {
                for char in firstText {
                    for charTwo in secondText {
                        if char == charTwo {
                            matchingChars.append(char)
                        }
                    }
                }
            }
        }
        
        allMatchingLettersLabel.text = matchingChars
        
    }
    
    @IBOutlet weak var allMatchingLettersLabel: UILabel!
    
    @IBAction func notMatchedCharactersButton(_ sender: UIButton) {
        var notmatchingChars = ""
        if let firstText = firstTextField.text {
            if let secondText = secondTextField.text {
                notmatchingChars = unmatchedCharacters(string1: firstText, string2: secondText)
            }
            
        }
        
        notMatchedCharactersLabel.text = notmatchingChars
        
    }
    @IBOutlet weak var notMatchedCharactersLabel: UILabel!
    
    
    
    @IBAction func uniqueCharsButton(_ sender: UIButton) {
        var notmatchingChars = ""
        if let firstText = firstTextField.text {
            if let secondText = secondTextField.text {
                notmatchingChars = uniqueChars(string1: firstText, string2: secondText)
            }
            
        }
        
        uniqueCharsLabel.text = notmatchingChars
    }
    
    @IBOutlet weak var uniqueCharsLabel: UILabel!
    
    
    func uniqueChars(string1: String, string2: String) -> String {

        var nonMatchingChars = ""

        for (index, char) in string1.enumerated() {
            if index >= string2.count || char != string2[string2.index(string2.startIndex, offsetBy: index)] {
                nonMatchingChars.append(char)
            }
        }

        if string2.count > string1.count {
            nonMatchingChars.append(String(string2[string2.index(string2.startIndex, offsetBy: string1.count)...]))
        }

        return nonMatchingChars
    }
    
    func unmatchedCharacters(string1: String, string2: String) -> String {
        var unmatchedCharacters: String = ""
        let minLength = min(string1.count, string2.count)
        
        for i in 0..<minLength {
            let char1 = string1[string1.index(string1.startIndex, offsetBy: i)]
            let char2 = string2[string2.index(string2.startIndex, offsetBy: i)]
            if char1 != char2 {
                unmatchedCharacters.append(char1)
                unmatchedCharacters.append(char2)
            }
        }
        
        var remainingChars1 = string1.dropFirst(minLength)
        var remainingChars2 = string2.dropFirst(minLength)
        unmatchedCharacters.append(contentsOf: remainingChars1)
        unmatchedCharacters.append(contentsOf: remainingChars2)
        return unmatchedCharacters
    }
   






    
}
