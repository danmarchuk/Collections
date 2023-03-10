//
//  SetController.swift
//  Collections
//
//  Created by Данік on 05/03/2023.
//

import UIKit

class SetController: UIViewController {
    var manager = Manager()
    
    
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
                notmatchingChars = manager.unmatchedCharacters(string1: firstText, string2: secondText)
            }
            
        }
        
        notMatchedCharactersLabel.text = notmatchingChars
        
    }
    @IBOutlet weak var notMatchedCharactersLabel: UILabel!
    
    
    
    @IBAction func uniqueCharsButton(_ sender: UIButton) {
        var notmatchingChars = ""
        if let firstText = firstTextField.text {
            if let secondText = secondTextField.text {
                notmatchingChars = manager.uniqueChars(string1: firstText, string2: secondText)
            }
            
        }
        
        uniqueCharsLabel.text = notmatchingChars
    }
    
    @IBOutlet weak var uniqueCharsLabel: UILabel!
    

    

   






    
}
