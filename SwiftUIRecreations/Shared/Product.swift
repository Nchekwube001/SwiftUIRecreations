//
//  Product.swift
//  SwiftUIRecreations
//
//  Created by francis on 20/06/2025.
//

import Foundation


///  Product Response
struct ProductsArray: Codable {
    let products: [Product]
    let total, skip, limit: Int
}


struct Product: Codable {
    let id: Int
    let title, description: String
    let price, discountPercentage, rating: Double
    let stock: Int
    let tags: [String]
    let brand: String?
    let sku: String
    let weight: Int
    let warrantyInformation, shippingInformation: String
    let minimumOrderQuantity: Int
    let images: [String]
    let thumbnail: String
}
