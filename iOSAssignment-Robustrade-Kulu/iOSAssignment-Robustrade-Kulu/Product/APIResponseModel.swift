//
//  APIResponseModel.swift
//  iOSAssignment-Robustrade-Kulu
//
//  Created by Himanshu Patwardhan on 06/02/26.
//

import Foundation

struct ProductResponse: Codable {
    let data: [Product]
    let pagination: Pagination
}

struct Pagination: Codable {
    let page: Int
    let limit: Int
    let total: Int
}

struct Product: Codable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let brand: String
    let stock: Int
    let image: String
    let specs: Specs
    let rating: Rating
}

struct Specs: Codable {
    let color: String?
    let weight: String?
    let storage: String?
}

struct Rating: Codable {
    let rate: Double
    let count: Int
}
