//
//  Response.swift
//  FavQuotes
//
//  Created by Anthony Odu on 28/04/2021.
//

import Foundation

protocol Response {
    func result<T>(data:T)
    func success(success:Bool)
    func error(error:Error)
}
