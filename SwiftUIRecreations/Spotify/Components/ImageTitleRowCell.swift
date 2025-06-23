//
//  ImageTitleRowCell.swift
//  SwiftUIRecreations
//
//  Created by francis on 21/06/2025.
//

import SwiftUI

struct ImageTitleRowCell: View {
    var imageSize: CGFloat = 100
    var imageName: String = Constants.randomImage
    var title: String = "Some Item Name"
    
    
    var body: some View {
        VStack(alignment: .leading,spacing:8) {
            ImageLoaderview(url: imageName)
                .frame(width: imageSize,height: imageSize)
            Text(title)
                .font(.callout)
                .lineLimit(2)
                .foregroundStyle(.spotifyLightGray)
        }
        .frame(width: imageSize)
        .padding(4)
    }
}

#Preview {
    ZStack{
        
        Color.spotifyBlack.ignoresSafeArea()
        
        ImageTitleRowCell()
    }
}
