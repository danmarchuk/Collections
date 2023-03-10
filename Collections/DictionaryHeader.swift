//
//  DictionaryHeader.swift
//  Collections
//
//  Created by Данік on 09/03/2023.
//

import UIKit

class DictionaryHeader: UICollectionReusableView {
    
    static let identifier = "DictionaryHeader"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Array"
        label.textAlignment = .right
        return label
    }()
    
    private let label2: UILabel = {
        let label2 = UILabel()
        label2.text = "Dictionary"
        label2.textAlignment = .left
        return label2
    }()
    
    
    
    public func configure() {
        backgroundColor = .white
        addSubview(label)
        addSubview(label2)
        

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
        label2.frame = bounds
    }
}
