//
//  ContentView.swift
//  SwiftUIRecreations
//
//  Created by francis on 20/06/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
                
                
            }
            ImageLoaderview()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
