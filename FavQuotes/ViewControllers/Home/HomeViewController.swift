//
//  ViewController.swift
//  FavQuotes
//
//  Created by Anthony Odu on 28/04/2021.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var quoteImageView: UIImageView!
    let viewModel = HomeViewModel()
    let child = SpinnerViewController()
    var arrayOfCategories = [AllTopics]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.barTintColor = .red
        viewModel.delegate = self
        loadCategory()
    }
    func loadCategory() {
        arrayOfCategories.removeAll()
        if let allCategories = viewModel.allCategories {
            arrayOfCategories.append(contentsOf: allCategories)
        }
        collectionView.reloadData()
    }
}

extension HomeViewController: UICollectionViewDataSource,
                              UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfCategories.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier, for: indexPath)
            as? CollectionViewCell {
            let categoryName = arrayOfCategories[indexPath.row]
            cell.categoryName.text = categoryName.topic
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}

extension HomeViewController: GetData {
    func result<T>(data: T) {
       let result = data as? [EachCategory]
        result?.forEach({ (singleCategory) in
            quoteImageView.downloaded(from: singleCategory.media)
        })
    }
    func loading(loading: Bool) {
        if loading {
            showSpinnerView(child: child)
        } else {
            removeSpinnerView(child: child)
        }
    }
    func failed(error: CustomError) {
        switch error {
        case .internetError(let message):
            self.showAlert(message: message)
        case .serverMessage(let message):
            self.showAlert(message: message)
        case .jsonMessage(let message):
            self.showAlert(message: message)
        }
    }
}
