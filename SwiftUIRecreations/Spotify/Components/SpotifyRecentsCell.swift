//
//  SpotifyRecentsCell.swift
//  SwiftUIRecreations
//
//  Created by francis on 20/06/2025.
//

import SwiftUI

struct SpotifyRecentsCell: View {
    var imageName:String = Constants.randomImage
    var title:String = "Random TItle"
    var body: some View {
        HStack(spacing: 16){
            ImageLoaderview(url: imageName)
                .frame(width: 55,height: 55)
            
            Text(title)
                .font(.callout)
                .fontWeight(.bold)
              
                .lineLimit(2)
            
            
        }
        .padding(.trailing, 8)
        .frame(maxWidth: .infinity,alignment: .leading)
        .themeColors(isSelected: false)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    ZStack{
        Color.spotifyBlack.ignoresSafeArea()
        
        VStack{
            HStack{
                SpotifyRecentsCell()
                SpotifyRecentsCell()
            }
            HStack{
                SpotifyRecentsCell()
                SpotifyRecentsCell()
            }
        }
    }
}
