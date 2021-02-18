//
//  MockCollectionViewCell.swift
//  TryModernCollectionView
//
//  Created by Erik Flores on 17/02/21.
//

import UIKit

class PersonCollectionViewCell : UICollectionViewCell {
//    var nameLabel: UILabel = {
//        var nameLabel = UILabel()
//        nameLabel.translatesAutoresizingMaskIntoConstraints = false
//        return nameLabel
//    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       // setup()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
//    func setup() {
//        contentView.backgroundColor = .systemBackground
//        contentView.addSubview(nameLabel)
//        NSLayoutConstraint.activate([
//            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
//            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
//            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
//            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
//        ])
//    }
    
}
