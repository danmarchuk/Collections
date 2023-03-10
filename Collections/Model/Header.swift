//
//  Header.swift
//  Collections
//
//  Created by Данік on 09/03/2023.
//

import UIKit

class Header: UICollectionReusableView {
    
    
    static let identifier = "Header"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Create an Int array with 10_000_000 elements"
        label.textAlignment = .center
        return label
    }()
    
    public func configure() {
        backgroundColor = .lightGray
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
    
}
