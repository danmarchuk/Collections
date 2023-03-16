//
//  Manager.swift
//  Collections
//
//  Created by Данік on 16/03/2023.
//

import Foundation
import UIKit

struct Manager {
    
    // MARK: - ViewController functions
    var random: Int {
        return Int.random(in: 10000..<100000)
    }
    
    
    // MARK: - shared functions
    
    func showActivityIndicator (sender: UICollectionReusableView) -> UIActivityIndicatorView {
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
    
    func calculateExecutionTime(end: DispatchTime, start: DispatchTime) -> Double {
        let executionTime = Double(end.uptimeNanoseconds - start.uptimeNanoseconds) / 1_000_000_000
        let roundedTime = round(executionTime * 1000) / 1000.0
        return roundedTime
    }


    func indentificatorForCell(cellNumber: Int) -> String {
         switch cellNumber {
         case 0:
             return "Cell_0"
         case 1:
             return "Cell_1"
         case 2:
             return "Cell_2"
         case 3:
             return "Cell_3"
         case 4:
             return "Cell_4"
         case 5:
             return "Cell_5"
         case 6:
             return "Cell_6"
         case 7:
             return "Cell_7"
         case 8:
             return "Cell_8"
         case 9:
             return "Cell_9"
         case 10:
             return "Cell_10"
         case 11:
             return "Cell_11"
         case 12:
             return "Cell_12"
         default:
             print("wow")
         }
         return "wow"
     }
    
    // MARK: - ArrayVC functions
    
    func textWithTime(cellNumber: Int, time: Double) -> String {
        switch cellNumber {
        case 0:
            return "Array creation time \(time)"
        case 1...6:
            return "Insertion time \(time)"
        case 7...12:
            return "Removal time \(time)"
        default:
            return "Error"
        }
    }


    

}
