//
//  QuoteViewModel.swift
//  FavQuotes
//
//  Created by Anthony Odu on 28/04/2021.
//

import Foundation

class QuotesViewModel {
    var repository: Repository?
    weak var delegate: GetData?
    var allCategories: [AllTopics]? {
        return Utils.arrayOfTopics()
    }
    init() {
        self.repository =  Repository()
    }
    func callFuncToGetAllData(topic: String) {
        delegate?.loading(loading: true)
        self.repository?.fetchQuoteByTopic(topic: topic) { [weak self] (result) in
            switch result {
            case .success(let data):
                self?.delegate?.result(data: data as [EachCategory])
            case .failure(let error):
                self?.delegate?.failed(error: error)
            }
            DispatchQueue.main.async {
                self?.delegate?.loading(loading: false)
            }
        }
    }
    deinit {
        repository = nil
    }
}
