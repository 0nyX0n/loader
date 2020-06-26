//
//  ContentView.swift
//  Loader
//
//  Created by Jérémy Supplis on 09/06/2020.
//  Copyright © 2020 Jérémy Supplis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    // Internal properties
    @State private var isCircle = false
    @State private var isRect = false
    
    var body: some View {
        NavigationView {
            // View
            VStack() {
                Spacer()
                Text("Loader")
                    .font(.largeTitle)
                    .bold()
                Spacer()
                HStack(spacing: 20) {
                    Spacer()
                    Button(action: {
                        self.isCircle.toggle()
                    }) {
                        Text("Cicrle")
                    }
                    Spacer()
                    Button(action: {
                        self.isRect.toggle()
                    }) {
                        Text("Rectangle")
                    }
                    Spacer()
                }
                Spacer()
                
                // Navigation
                NavigationLink(destination: LoaderCircleView(), isActive: $isCircle) { EmptyView() }
                NavigationLink(destination: LoaderRectView(), isActive: $isRect) { EmptyView() }
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
