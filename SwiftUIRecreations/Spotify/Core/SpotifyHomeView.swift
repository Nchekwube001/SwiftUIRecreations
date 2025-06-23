//
//  SpotifyHomeView.swift
//  SwiftUIRecreations
//
//  Created by francis on 20/06/2025.
//

import SwiftUI
import SwiftfulUI
struct SpotifyHomeView: View {
    @State private var currentUser:User? = nil
    @State private var products:[Product] = []
    @State private var productsArray:[ProductsArray] = []
    @State private var productRows:[ProductRow] = []
    @State private var selectedCategory:Category? = Category.all
    var body: some View {
        ZStack{
            Color.spotifyBlack.ignoresSafeArea()
            ScrollView{
                
                LazyVStack(pinnedViews:[.sectionHeaders] ) {
                    Section {
                        VStack{
                            recentsSection
                                .padding(.horizontal,16 )
                            if let firstProduct = products.first{
                                newReleaseProduct(product: firstProduct)
                                    .padding(.horizontal,16 )
                                
                            }
                            
                            
                          listRows
                            
                            
                            
                            
                        }
                        
                    } header:{
                        header
                    }
                }
                .padding(.top,20)
                
                
                
            }
            .scrollIndicators(.hidden)
            .clipped()
        }.task {
            await getData()
        }
        .toolbar(.hidden,for: .navigationBar)
    }
    
    
    private func getData()async {
        do{
            currentUser = try await DatabaseHelper().getUsers().first
            products = try await Array(DatabaseHelper().getProducts().prefix(8))
            var rows : [ProductRow] = []
            let allBrands = Set(products.map({$0.brand}))
            for brand in allBrands {
                let product  = self.products
                
                if let brand{
                    
                    
                    rows.append(ProductRow(title:brand.capitalized, products: products))
                    
                }
            }
            
            productRows = rows
            
            
        }  catch {
            
        }
    }
}


extension SpotifyHomeView {
    private var recentsSection: some View {
        
        NonLazyVGrid(
            columns:2,
            alignment: .center,
            spacing: 10,
            items: products
            
            
        ) { product in
            
            if let product{
                SpotifyRecentsCell(
                    imageName: product.firstImage,
                    title: product.title
                    
                )
                .asButton (.press){
                    
                }
            }
        }
    }
    
    
    private func newReleaseProduct(product:Product)-> some View{
        SpotifyNewReleaseCell(imageName: product.firstImage, headline: product.brand, subHeadline: product.brand, title: product.title, subtitle: product.description)  {
            
        } onPlayButtonPressed: {
            
        }
    }
    private var listRows:some View{
        ForEach(productRows){ rowItem in
            VStack(spacing: 8){
                Text(rowItem.title)
                    .font(.title)
                    .foregroundStyle(.spotifyWhite)
                    .fontWeight(.semibold)
                    .frame(maxWidth:.infinity, alignment: .leading)
                    .padding(.horizontal,16 )
                
                
                ScrollView(.horizontal) {
                    HStack(alignment:.top, spacing:16) {
                        
                        ForEach(rowItem.products){ item in
                    
                            ImageTitleRowCell(
                                imageSize: 120, imageName: item.firstImage, title: item.title
                            )
                            .asButton(.press) {
                                
                            }
                            
                        }
                    }
                    .padding(.horizontal,16 )
                }
                
            }
            
            
        }
    }
    private var header: some View {
        HStack(spacing: 0){
            HStack{
                if let currentUser {
                    ImageLoaderview(url: currentUser.image )
                        .frame(width: 30,height: 30)
                        .background(.spotifyWhite)
                        .clipShape(Circle())
                        .onTapGesture {
                            
                        }
                    
                }
            }.frame(width: 30,height: 30)
            
            ScrollView(.horizontal){
                HStack(spacing: 8) {
                    ForEach(Category.allCases,id:\.self){category in
                        SpotifyCategoryCell(title:category.rawValue.capitalized, isSelected: selectedCategory == category)
                            .onTapGesture {
                                selectedCategory = category
                            }
                    }
                }
                .padding(.horizontal,16)
            }
            .scrollIndicators(.hidden)
        }
        .padding(.vertical,20)
        .padding(.leading,16)
        .background(.spotifyBlack)
    }
}

#Preview {
    SpotifyHomeView()
}
