//
//  DatabaseHelper.swift
//  SwiftUIRecreations
//
//  Created by francis on 20/06/2025.
//

import Foundation

//https://dummyjson.com/
struct DatabaseHelper {
    func getProducts() async throws -> [Product] {
        guard let url = URL(string:"https://dummyjson.com/products") else{
            throw URLError(.badURL)
        }
        
       let (data, _) =  try await URLSession.shared.data(from: url)
        
        let products = try JSONDecoder().decode(ProductsArray.self, from: data)
        
        return products.products
    }
    
    
    func getUsers() async throws -> [User] {
        guard let url = URL(string:"https://dummyjson.com/users") else{
            throw URLError(.badURL)
        }
        
       let (data, _) =  try await URLSession.shared.data(from: url)
        
        let user = try JSONDecoder().decode(UsersArray.self, from: data)
        
        return user.users
    }
}





 
