//
//  ContentView.swift
//  SwiftUIRecreations
//
//  Created by francis on 20/06/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var users:[User] = []
    @State private var products:[Product] = []
    var body: some View {
        
        ScrollView{
            HStack{
                VStack {
                    
                    ForEach(users) { user in
                        Text(user.firstName)
                    }
                    
                    
                }
                VStack {
                    
                    
                    ForEach(products) { product in
                        Text(product.title)
                    }
                    
                }
            }
            
        }
        
        
        .padding()
        .task {
            await   getData()
        }
    }
    
    private func getData()async {
        do{
            users = try await DatabaseHelper().getUsers()
            products = try await DatabaseHelper().getProducts()
        }  catch {
            
        }
    }
}

#Preview {
    ContentView()
}
