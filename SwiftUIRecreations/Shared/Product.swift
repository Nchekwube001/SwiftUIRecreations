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


struct Product: Codable,Identifiable {
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
    
    
    var firstImage:String {
        images.first ?? Constants.randomImage
    }
    
    
    static var Mock:Product {
        Product(
            id: 123,
            title: "String",
            description: "String",
            price: 300,
            discountPercentage: 20,
            rating: 3,
            stock: 3,
            tags: ["String"],
            brand: "String",
            sku: "String",
            weight: 345,
            warrantyInformation: "String",
            shippingInformation: "String",
            minimumOrderQuantity: 2,
            images: [Constants.randomImage],
            thumbnail: "String"
        )
    }
}


struct ProductRow:Identifiable{
    let title: String
    let products: [Product]
    let id = UUID().uuidString
    
    
}
