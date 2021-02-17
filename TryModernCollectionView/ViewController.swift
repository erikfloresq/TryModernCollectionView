//
//  ViewController.swift
//  TryModernCollectionView
//
//  Created by Erik Flores on 17/02/21.
//

import UIKit

typealias DataSource = UICollectionViewDiffableDataSource<Section, Person>
typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Person>
typealias CellProvider = (UICollectionView, IndexPath, Person) -> UICollectionViewCell?


class ViewController: UIViewController {
    var collectionView = MainCollectionView()
    var people = [Person(photo: "", name: "Erik"), Person(photo: "", name: "Flores"), Person(photo: "", name: "Quispe")]
    private lazy var dataSource = makeDatSource()
    
    override func loadView() {
        super.loadView()
        title = "Modern Collection"
        view = collectionView
        view.backgroundColor = .systemGray
        collectionView.dataSource = dataSource
        applySnapshot()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func makeDatSource() -> DataSource {
        let cellProvider: CellProvider = { (collectionView, indexPath, mock) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MockCollectionViewCell",
                                                          for: indexPath) as? PersonCollectionViewCell
            cell?.nameLabel.text = self.people[indexPath.row].name
            return cell
        }
        let dataSource = DataSource(collectionView: collectionView, cellProvider: cellProvider)
        return dataSource
    }
    
    func applySnapshot() {
        var snapshot = Snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(people)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
}

