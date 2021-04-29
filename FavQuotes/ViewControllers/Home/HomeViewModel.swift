//
//  HomeViewModel.swift
//  FavQuotes
//
//  Created by Anthony Odu on 28/04/2021.
//

import Foundation

class HomeViewModel {
    var repository: Repository?
    weak var delegate: GetData?
    var allCategories: [AllTopics]? {
        return Utils.arrayOfTopics()
    }
    init() {
        self.repository =  Repository()
        callFuncToGetEmpData()
    }
    func callFuncToGetEmpData() {
        self.repository?.fetchTodaysQoute(completion: {[weak self] (result) in
            switch result {
            case .success(let data):
                self?.delegate?.result(data: data as [EachCategory])
            case .failure(let error):
                self?.delegate?.failed(error: error)
            }
        })
    }
}
