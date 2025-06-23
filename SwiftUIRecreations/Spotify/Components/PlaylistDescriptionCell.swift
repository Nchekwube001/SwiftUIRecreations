//
//  PlaylistDescriptionCell.swift
//  SwiftUIRecreations
//
//  Created by francis on 23/06/2025.
//

import SwiftUI

struct PlaylistDescriptionCell: View {
    var descriptionText:String = Product.Mock.description
    var username:String = "Francis"
    var subheadline:String = "Headline here"
    var onAddToPlaylistPressed: (()-> Void)? = nil
    var onDownloadPressed: (()-> Void)? = nil
    var onEllipsisPressed: (()-> Void)? = nil
    var onSharePressed: (()-> Void)? = nil
    var onShufflePressed: (()-> Void)? = nil
    var onPlayPressed: (()-> Void)? = nil
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            
            Text(descriptionText)
                .frame(maxWidth: .infinity,alignment: .leading)
            
            madeForYouSection
            Text(subheadline)
        
            buttonsRow
            
        }
        .font(.callout)
        .foregroundStyle(.spotifyLightGray)
    }
}



extension PlaylistDescriptionCell {
    private var buttonsRow: some View {
        HStack(spacing:0){
            HStack(spacing:0){
                Image(systemName: "plus.circle")
                    .padding(8)
                    .background(.spotifyBlack.opacity(0.001))
                    .onTapGesture {
                        onAddToPlaylistPressed?()
                    }
                Image(systemName: "arrow.down.circle")
                    .padding(8)
                    .background(.spotifyBlack.opacity(0.001))
                    .onTapGesture {
                        onDownloadPressed?()
                    }
                Image(systemName: "square.and.arrow.up")
                    .padding(8)
                    .background(.spotifyBlack.opacity(0.001))
                    .onTapGesture {
                        onSharePressed?()
                    }
                Image(systemName: "ellipsis")
                    .padding(8)
                    .background(.spotifyBlack.opacity(0.001))
                    .onTapGesture {
                        onEllipsisPressed?()
                    }
            }
            .offset(x:-8)
            .frame(maxWidth: .infinity,alignment: .leading)
            
            
            HStack(spacing:8){
                Image(systemName: "shuffle")
                    .font(.system(size: 24))
                 
                    .background(.spotifyBlack.opacity(0.001))
                    .onTapGesture {
                        onAddToPlaylistPressed?()
                    }
                Image(systemName: "play.circle.fill")
                    .font(.system(size: 46))
                 
                    .background(.spotifyBlack.opacity(0.001))
                  
                    .onTapGesture {
                        onAddToPlaylistPressed?()
                    }
            }
            .foregroundStyle(.spotifyGreen)
            
        }
        .font(.title2)
        
    }
    private var madeForYouSection: some View {
        
        HStack(spacing: 8) {
            Image(systemName: "applelogo")
                .font(.title3)
                .foregroundStyle(.spotifyGreen)
            
            Text("Made for ")
            +
            Text(username)
                .bold()
                .foregroundStyle(.spotifyWhite)
            
        }
    }
}

#Preview {
    ZStack{
        Color.spotifyBlack.ignoresSafeArea()
        PlaylistDescriptionCell()
            .padding()
    }
}
