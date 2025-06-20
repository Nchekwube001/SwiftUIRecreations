//
//  SpotifyCategoryCell.swift
//  SwiftUIRecreations
//
//  Created by francis on 20/06/2025.
//

import SwiftUI

struct SpotifyCategoryCell: View {
    var title: String = "Music"
    var isSelected: Bool = false
    var body: some View {
        Text(title)
            .font(.callout)
            .frame(minWidth: 35)
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
            .themeColors(isSelected: isSelected)
        
        
            .clipShape(Capsule())
        
    }
}


extension View {
    func themeColors (isSelected:Bool)-> some View {
        self
            .background(
                isSelected ? .spotifyGreen : .spotifyDarkGray
            )
            .foregroundStyle(
                isSelected ? .spotifyBlack : .spotifyWhite
            )
        
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        SpotifyCategoryCell()
    }
    
}
