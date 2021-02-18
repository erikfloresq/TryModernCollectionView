//
//  MainCollectionView.swift
//  TryModernCollectionView
//
//  Created by Erik Flores on 17/02/21.
//

import UIKit

class ListCollectionView: UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: UICollectionViewLayout())
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    

    
    func configureLayout() {
        let configure = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        collectionViewLayout = UICollectionViewCompositionalLayout.list(using: configure)
    }
    

    
}
