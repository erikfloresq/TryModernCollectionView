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
typealias ListCell = UICollectionView.CellRegistration<UICollectionViewListCell, Person>


class ListViewController: UIViewController {
    var collectionView = ListCollectionView()
    var people = [Person(photo: "", name: "Erik"), Person(photo: "", name: "Flores"), Person(photo: "", name: "Quispe")]
    private lazy var dataSource = makeDatSource()
    
    override func loadView() {
        super.loadView()
        title = "List"
        navigationController?.navigationBar.prefersLargeTitles = true
        view = collectionView
        collectionView.dataSource = dataSource
        view.backgroundColor = .systemBackground
        applySnapshot()
        addNavigationBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

// MARK: - CollectionView DataSource

extension ListViewController {
    func registerCell() -> ListCell{
        return ListCell { cell, _, person in
            var config = cell.defaultContentConfiguration()
            config.text = person.name
            cell.contentConfiguration = config
        }
    }
    
    func makeDatSource() -> DataSource {
        let cellProvider: CellProvider = { (collectionView, indexPath, mock) -> UICollectionViewCell? in
            let person = self.people[indexPath.row]
            let cell = collectionView.dequeueConfiguredReusableCell(using: self.registerCell(),
                                                                    for: indexPath,
                                                                    item: person)
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

// MARK: - BarButton

extension ListViewController {
    func addNavigationBar() {
        let plusImage = UIImage(systemName: "plus")
        let addAction = UIAction(title: "Add row", image: plusImage) { _ in
            let totalPeople = self.people.count
            let newPerson = Person(photo: "", name: "new element \(totalPeople)")
            self.people.append(newPerson)
            self.applySnapshot()
        }
        let minusImage = UIImage(systemName: "minus")
        let removeAction = UIAction(title: "Remove row", image: minusImage, attributes: .destructive) { _ in
            self.people.removeLast()
            self.applySnapshot()
        }
        
        
        let settingsIcon = UIImage(systemName: "gear")
        let identifier = UIMenu.Identifier(rawValue: "dev.erikflores.collection.settings")
        let menu = UIMenu(title: "Settings",
                          image: settingsIcon,
                          identifier: identifier,
                          options: .displayInline,
                          children: [addAction, removeAction])
        let settings = UIBarButtonItem(title: nil,
                                       image: settingsIcon,
                                       menu: menu)
        navigationItem.rightBarButtonItem = settings
    }
}

