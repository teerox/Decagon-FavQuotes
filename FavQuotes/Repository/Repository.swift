//
//  Repository.swift
//  FavQuotes
//
//  Created by Anthony Odu on 29/04/2021.
//

import Foundation

class Repository {
     func fetchTodaysQoute(completion: @escaping (_ result: Result<[EachCategory]>) -> Void) {
        DataSource.get { (result) in
            completion(result as Result<[EachCategory]>)
        }
    }

}
