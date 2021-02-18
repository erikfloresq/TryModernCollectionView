//
//  PhotosViewController.swift
//  TryModernCollectionView
//
//  Created by Erik Flores on 17/02/21.
//

import UIKit

class PhotosViewController: UIViewController {
    let collectionView = GalleryCollectionView()
    
    override func loadView() {
        super.loadView()
        title = "Photos"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
