//
//  SpotifyPlaylistView.swift
//  SwiftUIRecreations
//
//  Created by francis on 23/06/2025.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct SpotifyPlaylistView: View {
    var product:Product = .Mock
    var user:User = .Mock
    @Environment(\.router) var router
    
    
    @State private var products: [Product] = []
    @State private var showHeader: Bool = true
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
                    .readingFrame { frame in
                        
                        showHeader =  withAnimation{
                            frame.maxY < 150
                        }
                    }
                    //                        .background(
                    //
                    //                            GeometryReader{ geometry in
                    //                                Text("")
                    //                                    .frame(maxWidth: .infinity,maxHeight: .infinity)
                    //
                    //                            }
                    //                        )
                    
                    
                    
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
                    
                    ForEach(products){ product in
                        
                        SongRowCell(
                            imageName:product.firstImage,
                            title:product.title,
                            subtitle:product.description,
                            onCellPressed:{goToPlaylistView(product: product)},
                            onEllipsisPressed: nil
                        )
                        .padding(.leading,16)
                        
                    }
                }
            }
            .scrollIndicators(.hidden)
            
            header
                .frame(maxHeight: .infinity,alignment: .top)
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar )
    }
    
    
    private func getData()async {
        do{
            
            products = try await DatabaseHelper().getProducts()
            
        }  catch {
            
        }
    }
    
    private func goToPlaylistView (product:Product){
        
        router.showScreen(.push){ _ in
            SpotifyPlaylistView(product: product, user: user)
            
        }
    }
}


extension SpotifyPlaylistView {
    private var header : some View {
        ZStack{
            Text(product.title)
                .font(.headline)
                .foregroundStyle(.spotifyWhite)
                .padding(.vertical,20)
                .frame(maxWidth: .infinity)
                .background(.spotifyBlack)
                .offset(y:showHeader ? 0 : -40)
                .opacity(showHeader ? 1 : 0)
            
            Image(systemName: "chevron.left")
                .font(.title3)
                .padding(10)
                .foregroundStyle(.spotifyWhite)
            
                .background(showHeader ? .black.opacity(0.001) : .spotifyGray.opacity(0.7))
                .clipShape(Circle())
                .onTapGesture {
                    router.dismissScreen()
                }
                .padding(.leading,16)
                .frame(maxWidth: .infinity,alignment: .leading)
            
            
        }
        .foregroundStyle(.spotifyWhite)
        .animation(.smooth(duration: 0.2), value: showHeader)
        
        
        
    }
}
#Preview {
    
    RouterView{ _ in
        
        
        SpotifyPlaylistView(product: Product.Mock)
    }
}
