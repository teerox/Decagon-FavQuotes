//
//  EachCategory.swift
//  FavQuotes
//
//  Created by Anthony Odu on 28/04/2021.
//

import Foundation

struct EachCategory: Codable {
    let quoteId, title: String
    let author: String
    let url: String
    let media: String
    let cat: String
    enum CodingKeys: String, CodingKey {
        case quoteId = "id"
        case title
        case author
        case url
        case media
        case cat
    }
}

typealias EachCategoryResult = [EachCategory]

struct AllTopics: Codable {
    let topic: String
}

typealias AllTopicsElements = [AllTopics]
