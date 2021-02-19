//
//  PhotosViewController.swift
//  TryModernCollectionView
//
//  Created by Erik Flores on 17/02/21.
//

import UIKit

enum PhotosSection {
    case main
}

struct Photo: Hashable {
    let id = UUID()
    var image: UIImage?
}

class PhotosViewController: UIViewController {
    typealias PhotoDataSource = UICollectionViewDiffableDataSource<PhotosSection, Photo>
    typealias PhotoSnapshot = NSDiffableDataSourceSnapshot<PhotosSection, Photo>
    
    lazy var collectionView = GalleryCollectionView(frame: .zero, collectionViewLayout: generateLayout())
    var photos = [Photo(image: UIImage(named: "wallpaper1")),
                  Photo(image: UIImage(named: "wallpaper2")),
                  Photo(image: UIImage(named: "wallpaper1")),
                  Photo(image: UIImage(named: "wallpaper2"))]
    lazy var dataSource: PhotoDataSource = makeDataSource()
    
    override func loadView() {
        super.loadView()
        title = "Photos"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        view = collectionView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = dataSource
        let snapshot = photosSnapshot()
        dataSource.apply(snapshot)
        addNavigationBar()
    }
    
    func makeDataSource() -> PhotoDataSource {
        let dataSource = PhotoDataSource(collectionView: collectionView) { (collectionView, indexPath, photo) -> UICollectionViewCell? in
            let dequeueCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath)
            guard let cell = dequeueCell as? PhotoCollectionViewCell else {
                return nil
            }
            cell.photo.image = photo.image
            return cell
        }
        return dataSource
    }
    
    func photosSnapshot() -> PhotoSnapshot{
        var snapshot = PhotoSnapshot()
        snapshot.appendSections([PhotosSection.main])
        snapshot.appendItems(photos)
        return snapshot
    }
    
    func generateLayout() -> UICollectionViewLayout {
        // We have three row styles
        // Style 1: 'Full'
        // A full width photo
        // Style 2: 'Main with pair'
        // A 2/3 width photo with two 1/3 width photos stacked vertically
        // Style 3: 'Triplet'
        // Three 1/3 width photos stacked horizontally
        
        // Full
        let fullPhotoItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalWidth(2/3)))
        fullPhotoItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        // Main with pair
        let mainItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(2/3),
                heightDimension: .fractionalHeight(1.0)))
        mainItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        let pairItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(0.5)))
        pairItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        let trailingGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/3),
                heightDimension: .fractionalHeight(1.0)),
            subitem: pairItem,
            count: 2)
        
        let mainWithPairGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalWidth(4/9)),
            subitems: [mainItem, trailingGroup])
        
        let nestedGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalWidth(16/9)),
            subitems: [fullPhotoItem, mainWithPairGroup, fullPhotoItem])
        
        let section = NSCollectionLayoutSection(group: nestedGroup)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    func addNavigationBar() {
        let addIcon = UIImage(systemName: "plus")
        let action = UIAction(title: "add", image: addIcon) { (action) in
            self.photos.append(Photo(image: UIImage(named: "wallpaper1")))
            let snapshot = self.photosSnapshot()
            self.dataSource.apply(snapshot)
        }
        let menu = UIMenu(title: "Settings", image: nil, identifier: nil, options: .displayInline, children: [action])
        let settingsIcon = UIImage(systemName: "gear")
        let barButton = UIBarButtonItem(title: "", image: settingsIcon, primaryAction: nil, menu: menu)
        navigationItem.rightBarButtonItem = barButton
    }

}
