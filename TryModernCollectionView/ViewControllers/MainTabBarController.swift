//
//  MainTabBarController.swift
//  TryModernCollectionView
//
//  Created by Erik Flores on 17/02/21.
//

import UIKit

class MainTabBarController: UITabBarController {
    lazy var listVC: ListViewController = {
        var listVC = ListViewController()
        let listImage = UIImage(systemName: "list.dash")
        let listImageSelected = UIImage(systemName: "list.bullet.indent")
        let tabBarItem = UITabBarItem(title: "List", image: listImage, selectedImage: listImageSelected)
        listVC.tabBarItem = tabBarItem
        return listVC
    }()
    
    lazy var photosVC: PhotosViewController = {
        var photosVC = PhotosViewController()
        let photosImage = UIImage(systemName: "photo.on.rectangle")
        let photosImageSelected = UIImage(systemName: "photo.fill.on.rectangle.fill")
        let tabBarItem = UITabBarItem(title: "Photos", image: photosImage, selectedImage: photosImageSelected)
        photosVC.tabBarItem = tabBarItem
        return photosVC
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let list = UINavigationController(rootViewController: listVC)
        let photos = UINavigationController(rootViewController: photosVC)
        viewControllers = [photos, list]
    }

}
