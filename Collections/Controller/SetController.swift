//
//  SetController.swift
//  Collections
//
//  Created by Данік on 05/03/2023.
//

import UIKit

class SetController: UIViewController {
    var manager = Manager()
    
    // TextFields
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    
    // labels
    @IBOutlet weak var allMatchingLettersLabel: UILabel!
    @IBOutlet weak var notMatchedCharactersLabel: UILabel!
    @IBOutlet weak var uniqueCharsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        allMatchingLettersLabel.isHidden = true
//        notMatchedCharactersLabel.isHidden = true
//        uniqueCharsLabel.isHidden = true
    }
    
    
    // button 1
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
        allMatchingLettersLabel.isHidden = false
        allMatchingLettersLabel.text = matchingChars
        
    }

    // button 2
    @IBAction func notMatchedCharactersButton(_ sender: UIButton) {
        var notmatchingChars = ""
        if let firstText = firstTextField.text {
            if let secondText = secondTextField.text {
                notmatchingChars = manager.unmatchedCharacters(string1: firstText, string2: secondText)
            }
        }
        notMatchedCharactersLabel.isHidden = false
        notMatchedCharactersLabel.text = notmatchingChars
        
    }

    
    
    
    @IBAction func uniqueCharsButton(_ sender: UIButton) {
        var notmatchingChars = ""
        if let firstText = firstTextField.text {
            if let secondText = secondTextField.text {
                notmatchingChars = manager.uniqueChars(string1: firstText, string2: secondText)
            }
        }
        uniqueCharsLabel.isHidden = false
        uniqueCharsLabel.text = notmatchingChars
    }
    

    

    

   






    
}
