//
//  QuoteViewController.swift
//  FavQuotes
//
//  Created by Anthony Odu on 28/04/2021.
//

import UIKit

class QuoteViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var allQuotes = [EachCategory]()
    let viewModel = QuotesViewModel()
    let child = SpinnerViewController()
    var eachCategory: AllTopics?
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        let backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
               navigationItem.backBarButtonItem = backBarButtonItem
        self.title = eachCategory?.topic
        viewModel.delegate = self
        loadData(data: eachCategory)
    }
    func loadData(data: AllTopics?) {
        if let result = data {
            viewModel.callFuncToGetAllData(topic: result.topic)
        }
    }
}

extension QuoteViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allQuotes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier, for: indexPath)
            as? TableViewCell {
            let value = allQuotes[indexPath.row]
            cell.authorLabel.text = value.author
            cell.tiltleLabel.text = value.title
            return cell
        } else {
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVc = UIStoryboard.init(name: "Main", bundle: Bundle.main)
            .instantiateViewController(withIdentifier: "SingleQuoteViewController") as?
            SingleQuoteViewController
        if let viewController = nextVc {
            let value = allQuotes[indexPath.row]
            viewController.eachSingleQoute = value
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

extension QuoteViewController: GetData {
    func result<T>(data: T) {
       let result = data as? [EachCategory]
        if let finalResult = result {
            allQuotes.removeAll()
            allQuotes.append(contentsOf: finalResult)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    func loading(loading: Bool) {
        DispatchQueue.main.async {
            if loading {
                self.showSpinnerView(child: self.child)
            } else {
                self.removeSpinnerView(child: self.child)
            }
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
