//
//  DictionaryHeader.swift
//  Collections
//
//  Created by Данік on 16/03/2023.
//

import UIKit

class DictionaryHeader: UICollectionReusableView {
    
    static let identifier = "DictionaryHeader"
        override func awakeFromNib() {
            super.awakeFromNib()
        }
        
        private let stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.alignment = .fill
            stackView.distribution = .fillEqually
            
            let label = UILabel()
            label.text = "Array"
            label.textAlignment = .center
            
            let label2 = UILabel()
            label2.text = "Dictionary"
            label2.textAlignment = .center
            
            stackView.addArrangedSubview(label)
            stackView.addArrangedSubview(label2)
            return stackView
        }()
        
        
        
        public func configure() {
            backgroundColor = .white
            addSubview(stackView)
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            stackView.frame = bounds
        }

        
}
