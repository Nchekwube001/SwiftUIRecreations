//
//  ContentView.swift
//  SwiftUIRecreations
//
//  Created by francis on 20/06/2025.
//

import SwiftUI
import SwiftfulRouting

struct ContentView: View {
    @Environment(\.router) var router
    var body: some View {
        
        List{
            Button("Open Spotify"){
                router.showScreen(.fullScreenCover){ _ in
                    SpotifyHomeView()
                }
            }
            
        }
        
        
    }
    
    
}

#Preview {
    RouterView { _ in
        ContentView()
        
    }
}
