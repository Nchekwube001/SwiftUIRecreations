//
//  SongRowCell.swift
//  SwiftUIRecreations
//
//  Created by francis on 23/06/2025.
//

import SwiftUI

struct SongRowCell: View {
    var imageSize:CGFloat = 50;
    var imageName: String = Constants.randomImage
    var title:String = "Cell Title"
    var subtitle:String? = "Cell SUbtitle"
    var onCellPressed:(()-> Void)? = nil
    var onEllipsisPressed:(()-> Void)? = nil
    
    
    
    var body: some View {
        HStack(spacing: 8) {
            ImageLoaderview(url:imageName)
                .frame(width: imageSize,height: imageSize)
            
            VStack(alignment:.leading,spacing:4){
                Text(title)
                    .font(.body)
                    .foregroundStyle(.spotifyWhite)
                    .lineLimit(2)
                
                
                if let subtitle {
                    Text(subtitle)
                        .font(.body)
                        .foregroundStyle(.spotifyGray)
                        .lineLimit(1)
                    
                }
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.horizontal,8)
            
            Image(systemName: "ellipsis")
                .font(.subheadline)
                .foregroundStyle(.spotifyWhite)
          
                .padding(16)
                .background(Color.spotifyBlack.opacity(0.001))
                .onTapGesture {
                    onEllipsisPressed?()
                }
        }
        .foregroundStyle(.red)
        .onTapGesture {
            onCellPressed?()
        }
    }
}

#Preview {
   
    ZStack{
        Color.spotifyBlack.ignoresSafeArea()
        VStack{
            
    
        SongRowCell()
        SongRowCell()
        SongRowCell()
        SongRowCell()
        }
    }
}
