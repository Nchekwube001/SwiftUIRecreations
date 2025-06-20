//
//  SpotifyNewReleaseCell.swift
//  SwiftUIRecreations
//
//  Created by francis on 20/06/2025.
//

import SwiftUI

struct SpotifyNewReleaseCell: View {
    var imageName:String = Constants.randomImage
    var headline: String? = "New release from"
    var subHeadline: String? = "Some artist"
    var title: String? = "Some Playlist"
    var subtitle: String? = "Single - Title"
    var onAddToPlaylistPressed: (()-> Void)? = nil
    var onPlayButtonPressed: (()-> Void)? = nil
    
    var body: some View {
        VStack(spacing: 16) {
            HStack{
                ImageLoaderview(url: imageName)
                    .frame(width: 50,height: 50)
                    .clipShape(Circle())
                
                
                
                VStack(alignment: .leading, spacing: 2) {
                    if let headline {
                        Text(headline)
                            .foregroundStyle(.spotifyLightGray)
                            .font(.callout)
                            .lineLimit(1)
                        
                    }
                    if let subHeadline {
                        Text(subHeadline)
                            .foregroundStyle(.spotifyWhite)
                            .font(.title2)
                            .fontWeight(.medium)
                            .lineLimit(1)
                        
                    }
                }
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            
            
            HStack{
                ImageLoaderview(url: imageName)
                    .frame(width: 140,height: 140)
                VStack(alignment: .leading, spacing: 32){
                    VStack(alignment: .leading, spacing: 2){
                        if let title {
                            Text(title)
                                .foregroundStyle(.spotifyWhite)
                                .fontWeight(.semibold)
                                .lineLimit(1)
                            
                            
                        }
                        if let subtitle {
                            Text(subtitle)
                                .foregroundStyle(.spotifyLightGray)
                                .lineLimit(1)
                            
                            
                            
                        }
                    }
                    
                    .font(.callout)
                    
                    HStack(spacing:0 ){
                        Image(systemName: "plus.circle")
                            .foregroundStyle(.spotifyLightGray)
                            .padding(4)
                            .background(Color.spotifyBlack.opacity(0.001))
                            .onTapGesture {
                                onAddToPlaylistPressed?()
                            }
                            .offset(y:-4)
                            .frame(maxWidth: .infinity,alignment: .leading)
                        Image(systemName: "plus.circle.fill")
                            .foregroundStyle(.spotifyWhite)
                            .font(.title)
                        
                        
                    }
                    
                }
                .padding(.trailing,16)
                .padding(.leading,16)
                
                
            }
            .themeColors(isSelected: false)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            //            .frame(maxWidth: .infinity,alignment: .leading)
        }
        .onTapGesture {
            onPlayButtonPressed?()
        }
    }
}

#Preview {
    
    ZStack{
        Color.spotifyBlack.ignoresSafeArea()
        
        
        VStack{
            SpotifyNewReleaseCell()
            
        }
    }
}
