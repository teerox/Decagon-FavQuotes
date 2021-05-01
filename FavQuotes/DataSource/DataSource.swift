//
//  Repository.swift
//  FavQuotes
//
//  Created by Anthony Odu on 28/04/2021.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(CustomError)
}

class DataSource {
   static func get<T: Codable>( completion: @escaping (Result<T>) -> Void) {
        APIManger.requestData(url: "/quotes/?size=medium", method: .get, parameters: nil) {  (result) in
            switch result {
            case .success(let jsonData):
                let decoder = JSONDecoder()
                do {
                    let objects = try decoder.decode(T.self, from: jsonData)
                    let result: Result<T> = Result.success(objects)
                    completion(result)
                } catch {
                    print(error)
                    completion(.failure(.jsonMessage("Error Fetching Today's Quote")))
                }
            case .failure(let failure):
                switch failure {
                case .connectionError:
                    completion(.failure(.internetError("Check your Internet connection.")))
                default:
                    completion(.failure(.serverMessage("Unknown Error")))
                }
            }
        }
    }
    static func getAllQuoteByTopic<T: Codable>(topic: String, completion: @escaping (Result<T>) -> Void) {
         APIManger.requestData(url: "/quotes/?size=medium&maxR=10&t=\(topic)",
                               method: .get, parameters: nil) {  (result) in
             switch result {
             case .success(let jsonData):
                 let decoder = JSONDecoder()
                 do {
                     let objects = try decoder.decode(T.self, from: jsonData)
                     let result: Result<T> = Result.success(objects)
                     completion(result)
                 } catch {
                     print(error)
                     completion(.failure(.jsonMessage("Error Fetching Today's Quote")))
                 }
             case .failure(let failure):
                 switch failure {
                 case .connectionError:
                     completion(.failure(.internetError("Check your Internet connection.")))
                 default:
                     completion(.failure(.serverMessage("Unknown Error")))
                 }
             }
         }
     }
}
