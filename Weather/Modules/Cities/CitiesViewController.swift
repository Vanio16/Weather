//
//  CitiesViewController.swift
//  Weather
//
//  Created by Ivan Zakharov on 6/9/21.
//

import Foundation
import UIKit

protocol CitiesViewOutput {
    func getCityId(id: String)
}

let cities = [City(name: "Омск", id: "1496153"),
City(name: "Москва", id: "524901"),
City(name: "Санкт-Петербург", id: "4171563"),
City(name: "Екатеринбург", id: "1486209"),
City(name: "Казань", id: "551487"),
City(name: "Владивосток", id: "2013348"),
City(name: "Новосибирск", id: "1496747"),
City(name: "Калининград", id: "554234"),
City(name: "Сургут", id: "1490624"),
City(name: "Чита", id: "2025339"),]

final class CitiesViewController: UIViewController {

    private struct Constants {

    }

    private let output: CitiesViewOutput

// MARK: - Subviews
    private let collectionViewFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        return layout
    }()
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)

    // MARK: - Lifecycle

    init(output: CitiesViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "collectionViewCell")
        collectionView.backgroundColor = .clear
        view.backgroundColor = UIColor(red: 114, green: 144, blue: 185)
    }

    // MARK: - Layout

    override func viewDidLayoutSubviews() {
        collectionView.configureFrame { maker in
            maker.top()
                .bottom()
                .right()
                .left(to: view.nui_safeArea.left)
        }
    }
}

extension CitiesViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as? CollectionViewCell
        cell?.refreshContent(cities[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        output.getCityId(id: cities[indexPath.row].id)
        dismiss(animated: true, completion: nil)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width - 32 - view.safeAreaInsets.left - view.safeAreaInsets.right
        return CGSize(width: width, height: 150)
    }
}
