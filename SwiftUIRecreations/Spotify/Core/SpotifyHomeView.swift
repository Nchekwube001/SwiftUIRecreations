//
//  SpotifyHomeView.swift
//  SwiftUIRecreations
//
//  Created by francis on 20/06/2025.
//

import SwiftUI

struct SpotifyHomeView: View {
    @State private var currentUser:User? = nil
    @State private var selectedCategory:Category? = Category.all
    var body: some View {
        ZStack{
            Color.spotifyBlack.ignoresSafeArea()
            header
        }.task {
            await getData()
        }
    }
    
    
    private func getData()async {
        do{
            currentUser = try await DatabaseHelper().getUsers().first
            
        }  catch {
            
        }
    }
}


extension SpotifyHomeView {
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
        }
    }
}

#Preview {
    SpotifyHomeView()
}
