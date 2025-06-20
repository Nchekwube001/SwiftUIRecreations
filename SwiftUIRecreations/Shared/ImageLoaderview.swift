//
//  ImageLoaderview.swift
//  SwiftUIRecreations
//
//  Created by francis on 20/06/2025.
//

import SwiftUI
import SDWebImageSwiftUI
struct ImageLoaderview: View {
    var url:String = Constants.randomImage
    var resizingMode: ContentMode = .fill
    
    var body: some View {
        Rectangle()
            .opacity(0.001)
            .overlay {
                WebImage(url: URL(string: url))
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: resizingMode)
                    .allowsHitTesting(false)
            }
//            .rotationEffect(Angle(degrees: 135))
            .clipped()
    }
}

#Preview {
    ImageLoaderview()
        .cornerRadius(30)
        .padding(40)
        .padding(.vertical,60)
}
