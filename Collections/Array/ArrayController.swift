//
//  ViewController.swift
//  Collections
//
//  Created by Данік on 03/03/2023.
//

import UIKit

class ArrayController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        stackViewWithArrayManipulationButtons.isHidden = true
    }
    
    var manager = Manager()
    
    var intArray: [Int] = []
    var time: Double = 0.0
    let oneThousandElements = Array(0...999)
    lazy var middleIndex = intArray.count / 2
    lazy var endIndex = intArray.count
    
    @IBOutlet weak var stackViewWithArrayManipulationButtons: UIStackView!
    @IBAction func createAnArray(_ sender: UIButton) {
        // disable the button while the array is being created
        buttonDisabled(sender: sender)
        let activityIndicator = showActivityIndicator(sender: sender)
        
        DispatchQueue.global(qos: .userInitiated).async {
            // Get the start time
            let start = DispatchTime.now()
            // create an array
            self.intArray = [Int](0..<10000000)
            // Get the end time
            let end = DispatchTime.now()
            // Calculate the execution time
            self.time = self.manager.calculateExecutionTime(end: end, start: start)
            // Switch back to the main thread to update the UI
            DispatchQueue.main.async {
                sender.setTitle("Array creation time: \(self.time) ms.", for: .normal)
                // Remove the loading progress bar
                activityIndicator.removeFromSuperview()
                // show the buttons
                self.stackViewWithArrayManipulationButtons.isHidden = false
                // Enable the button
                sender.isEnabled = true
            }
        }
    }
    
    
    
    @IBAction func insertAtTheBeginningOneByOne(_ sender: UIButton) {
        // disable the button while the action is being performed
        buttonDisabled(sender: sender)
        let activityIndicator = showActivityIndicator(sender: sender)

        DispatchQueue.global(qos: .userInitiated).async {
            // Get the start time
            let start = DispatchTime.now()
            // insert elements at the beginning
            for element in self.oneThousandElements {
                self.intArray.insert(element, at: 0)
            }
            self.endTime(start: start, sender: sender, activityIndicator: activityIndicator)
        }
    }
    @IBAction func insertAtTheBeginning(_ sender: UIButton) {
        
        // disable the button while the action is being performed
        buttonDisabled(sender: sender)
        let activityIndicator = showActivityIndicator(sender: sender)

        DispatchQueue.global(qos: .userInitiated).async {
            // Get the start time
            let start = DispatchTime.now()
            // insert elements at the beginning
            self.intArray.insert(contentsOf: self.oneThousandElements, at: 0)
            
            self.endTime(start: start, sender: sender, activityIndicator: activityIndicator)
        }
    }
    
    @IBAction func insertInTheMiddleOneByOne(_ sender: UIButton) {
        // disable the button while the action is being performed
        buttonDisabled(sender: sender)
        let activityIndicator = showActivityIndicator(sender: sender)
        
        DispatchQueue.global(qos: .userInitiated).async {
            // Get the start time
            let start = DispatchTime.now()
            // insert the elements in the middle
            for (index, element) in self.oneThousandElements.enumerated() {
                self.intArray.insert(element, at: self.middleIndex + index)
            }
            self.endTime(start: start, sender: sender, activityIndicator: activityIndicator)
        }
        
    }
    
    @IBAction func insertInTheMiddle(_ sender: UIButton) {
        // disable the button while the action is being performed
        buttonDisabled(sender: sender)
        let activityIndicator = showActivityIndicator(sender: sender)

        DispatchQueue.global(qos: .userInitiated).async {
            // Get the start time
            let start = DispatchTime.now()
            // insert elements at the beginning
            self.intArray.insert(contentsOf: self.oneThousandElements, at: self.middleIndex)
            
            self.endTime(start: start, sender: sender, activityIndicator: activityIndicator)
        }
    }

    
    
    
    @IBAction func insertAtTheEndOneByOne(_ sender: UIButton) {
        // disable the button while the action is being performed
        buttonDisabled(sender: sender)
        let activityIndicator = showActivityIndicator(sender: sender)

        DispatchQueue.global(qos: .userInitiated).async {
            // Get the start time
            let start = DispatchTime.now()
            // insert the elements at the end
            for element in self.oneThousandElements {
                self.intArray.insert(element, at: self.endIndex)
            }
            self.endTime(start: start, sender: sender, activityIndicator: activityIndicator)
        }
    }
    
    @IBAction func insertAtTheEnd(_ sender: UIButton) {
        // disable the button while the action is being performed
        buttonDisabled(sender: sender)
        let activityIndicator = showActivityIndicator(sender: sender)

        DispatchQueue.global(qos: .userInitiated).async {
            // Get the start time
            let start = DispatchTime.now()
            // insert the elements at the end
            self.intArray.insert(contentsOf: self.oneThousandElements, at: self.endIndex)
            // Get the end time
            self.endTime(start: start, sender: sender, activityIndicator: activityIndicator)
        }
    }
    
    
    
    @IBAction func removeAtTheEndOneByOne(_ sender: UIButton) {
        // disable the button while the action is being performed
        buttonDisabled(sender: sender)
        let activityIndicator = showActivityIndicator(sender: sender)

        DispatchQueue.global(qos: .userInitiated).async {
            // Get the start time
            let start = DispatchTime.now()
            // remove the elements at the end
            for _ in self.oneThousandElements {
                self.intArray.removeLast()
            }
            // Get the end time
            let end = DispatchTime.now()
            // Calculate the execution time
            self.time = self.manager.calculateExecutionTime(end: end, start: start)
            // Switch back to the main thread to update the UI
            self.dispatchForRemoval(sender: sender, activityIndicator: activityIndicator)
        }
    }
    
    @IBAction func removeAtTheEnd(_ sender: UIButton) {
        
        // disable the button while the action is being performed
        buttonDisabled(sender: sender)
        let activityIndicator = showActivityIndicator(sender: sender)

        DispatchQueue.global(qos: .userInitiated).async {
            // Get the start time
            let start = DispatchTime.now()
            // remove the elements at the end
            self.intArray.removeLast(1000)
            // Get the end time
            let end = DispatchTime.now()
            // Calculate the execution time
            self.time = self.manager.calculateExecutionTime(end: end, start: start)
            // Switch back to the main thread to update the UI
            self.dispatchForRemoval(sender: sender, activityIndicator: activityIndicator)
        }
        
    }
    
    
    
    @IBAction func removeAtTheBeginningOneByONe(_ sender: UIButton) {
        // disable the button while the action is being performed
        buttonDisabled(sender: sender)
        let activityIndicator = showActivityIndicator(sender: sender)

        DispatchQueue.global(qos: .userInitiated).async {
            // Get the start time
            let start = DispatchTime.now()
            // remove the elements at the end
            for _ in self.oneThousandElements {
                self.intArray.removeFirst()
            }
            // Get the end time
            let end = DispatchTime.now()
            // Calculate the execution time
            self.time = self.manager.calculateExecutionTime(end: end, start: start)
            // Switch back to the main thread to update the UI
            self.dispatchForRemoval(sender: sender, activityIndicator: activityIndicator)
        }
    }
    
    @IBAction func removeAtTheBeginning(_ sender: UIButton) {
        // disable the button while the action is being performed
        buttonDisabled(sender: sender)
        let activityIndicator = showActivityIndicator(sender: sender)

        DispatchQueue.global(qos: .userInitiated).async {
            // Get the start time
            let start = DispatchTime.now()
            // remove the elements at the beginning
            self.intArray.removeFirst(1000)
            // Get the end time
            let end = DispatchTime.now()
            // Calculate the execution time
            self.time = self.manager.calculateExecutionTime(end: end, start: start)
            // Switch back to the main thread to update the UI
            self.dispatchForRemoval(sender: sender, activityIndicator: activityIndicator)
        }
    }
    
    
    @IBAction func removeInTheMiddleOneByOne(_ sender: UIButton) {
        // disable the button while the action is being performed
        buttonDisabled(sender: sender)
        let activityIndicator = showActivityIndicator(sender: sender)
        
        
        DispatchQueue.global(qos: .userInitiated).async {
            // Get the start time
            let start = DispatchTime.now()
            // insert the elements in the middle
            for (index, _) in self.oneThousandElements.enumerated() {
                self.intArray.remove(at: self.middleIndex + index)
            }
            // Get the end time
            let end = DispatchTime.now()
            // Calculate the execution time
            self.time = self.manager.calculateExecutionTime(end: end, start: start)
            // Switch back to the main thread to update the UI
            self.dispatchForRemoval(sender: sender, activityIndicator: activityIndicator)
        }
    }
    
    @IBAction func removeInTheMiddle(_ sender: UIButton) {
        // disable the button while the action is being performed
        buttonDisabled(sender: sender)
        let activityIndicator = showActivityIndicator(sender: sender)
        
        DispatchQueue.global(qos: .userInitiated).async {
            // Get the start time
            let start = DispatchTime.now()
            // remove the elements in the middle
            self.intArray.removeSubrange(self.middleIndex..<self.middleIndex + 1000)
            // Get the end time
            let end = DispatchTime.now()
            // Calculate the execution time
            self.time = self.manager.calculateExecutionTime(end: end, start: start)
            // Switch back to the main thread to update the UI
            self.dispatchForRemoval(sender: sender, activityIndicator: activityIndicator)
        }
        
    }
    
    
    func showActivityIndicator (sender: UIButton) -> UIActivityIndicatorView {
        // Show a loading progress bar inside the button
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .white
        activityIndicator.startAnimating()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        sender.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: sender.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: sender.centerYAnchor)
        ])
        return activityIndicator
    }
    
    
    func dispatch(sender: UIButton, activityIndicator: UIActivityIndicatorView) {
        DispatchQueue.main.async {
            sender.setTitle("Insertion time: \(self.time) ms.", for: .normal)
            // Remove the loading progress bar
            activityIndicator.removeFromSuperview()
            // Enable the button
            sender.isEnabled = true
        }
    }
    
    func dispatchForRemoval(sender: UIButton, activityIndicator: UIActivityIndicatorView) {
        DispatchQueue.main.async {
            sender.setTitle("Removal time: \(self.time) ms.", for: .normal)
            // Remove the loading progress bar
            activityIndicator.removeFromSuperview()
            // Enable the button
            sender.isEnabled = true
        }
    }
    
    func endTime(start: DispatchTime, sender: UIButton, activityIndicator: UIActivityIndicatorView) {
        // Get the end time
        let end = DispatchTime.now()
        // Calculate the execution time
        self.time = self.manager.calculateExecutionTime(end: end, start: start)
        // Switch back to the main thread to update the UI
        self.dispatch(sender: sender, activityIndicator: activityIndicator)
        
    }
    
    func buttonDisabled(sender: UIButton) {
        sender.isEnabled = false
    }
    
}

