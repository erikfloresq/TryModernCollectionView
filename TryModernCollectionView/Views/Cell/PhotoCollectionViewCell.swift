//
//  PhotoCollectionViewCell.swift
//  TryModernCollectionView
//
//  Created by Erik Flores on 17/02/21.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    var photo: UIImageView = {
        var photo = UIImageView()
        photo.translatesAutoresizingMaskIntoConstraints = false
        return photo
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addPhoto()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    private func addPhoto() {
        contentView.addSubview(photo)
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            photo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            photo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            photo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0)
        ])
    }
}
