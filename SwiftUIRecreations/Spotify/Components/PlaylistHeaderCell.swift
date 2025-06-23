//
//  PlaylistHeaderCell.swift
//  SwiftUIRecreations
//
//  Created by francis on 23/06/2025.
//

import SwiftUI
import SwiftUI

struct PlaylistHeaderCell: View {
    var title: String = "SomePlaylist title"
    var subtitle: String = "Subtitle goes here"
    var imageName:String = Constants.randomImage
    var shadowColor:Color = .spotifyBlack.opacity(0.8)
    var height:CGFloat = 300
    var body: some View {
        Rectangle()
            .opacity(0)
            .overlay(content: {
                ImageLoaderview(
                    url: imageName
                )
            })
            .overlay (
                VStack(alignment: .leading, spacing:8){
                    Text(subtitle)
                        .font(.headline)
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                    .foregroundStyle(.spotifyWhite)
                    .padding(16)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .background(
                        LinearGradient(colors: [shadowColor.opacity(0),shadowColor], startPoint: .top, endPoint: .bottom)
                    )
                
                
                
                , alignment: .bottomLeading
            )
            .asStretchyHeader(startingHeight: height)
        
        
    }
}

#Preview {
    ZStack{
        Color.spotifyBlack.ignoresSafeArea()
        
        ScrollView{
            PlaylistHeaderCell()
        }
        .ignoresSafeArea()
    }
}
