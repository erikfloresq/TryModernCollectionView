//
//  GalleryCollectionView.swift
//  TryModernCollectionView
//
//  Created by Erik Flores on 17/02/21.
//

import UIKit

class GalleryCollectionView: UICollectionView {

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
