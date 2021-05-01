//
//  Response.swift
//  FavQuotes
//
//  Created by Anthony Odu on 28/04/2021.
//

import Foundation

public enum CustomError {
       case jsonMessage(String)
       case internetError(String)
       case serverMessage(String)
   }

protocol GetData: class {
    func result<T>(data: T)
    func loading(loading: Bool)
    func failed(error: CustomError)
}
