//
//  SpotifyPlaylistView.swift
//  SwiftUIRecreations
//
//  Created by francis on 23/06/2025.
//

import SwiftUI

struct SpotifyPlaylistView: View {
    var product:Product = .Mock
    var user:User = .Mock
    var body: some View {
        ZStack{
            Color.spotifyBlack.ignoresSafeArea()
            
            
            ScrollView(.vertical){
                LazyVStack(spacing:12){
                    PlaylistHeaderCell(
                        title: product.title,
                        subtitle: product.description,
                        imageName: product.firstImage,
                        height: 300
                    )
                    
                    PlaylistDescriptionCell(
                        descriptionText: product.description,
                        username: user.firstName,
                        subheadline: product.title,
                        onAddToPlaylistPressed: nil,
                        onDownloadPressed: nil,
                        onEllipsisPressed: nil,
                        onSharePressed: nil,
                        onShufflePressed: nil,
                        onPlayPressed: nil
                    )
                    .padding(.horizontal,16)
                }
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    SpotifyPlaylistView(product: Product.Mock)
}
