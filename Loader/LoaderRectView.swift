//
//  LoaderRectView.swift
//  Loader
//
//  Created by Jérémy Supplis on 09/06/2020.
//  Copyright © 2020 Jérémy Supplis. All rights reserved.
//

import SwiftUI

let lightGreen = Color(UIColor(red: 0.44, green: 0.93, blue: 0.72, alpha: 1.00))

struct LoaderRectView: View {
    
    @State var time: Double = 0
    @State private var offsetY: CGFloat = 210.0
    @State private var animate = false
    @State private var label = "Downloading"
    
    var body: some View {
        VStack {
            ZStack {
                Capsule()
                    .frame(width: 100, height: 400)
                    .foregroundColor(.white)
                    .shadow(radius: 5)
                
                ZStack {
                    RectFluidShape(time: CGFloat(time * 1.2))
                        .foregroundColor(lightGreen)
                        .frame(width: 100, height: 400)
                    
                    RectFluidShape(time: CGFloat(time))
                        .foregroundColor(.green)
                        .frame(width: 100, height: 400)
                }
                .offset(x: 0, y: offsetY)
                .mask(Capsule().frame(width: 100, height: 400))
            }
            
            Button(action: {
                self.animate.toggle()
                self.label = "Downloading..."
            }) {
                Text(label)
                    .font(.largeTitle)
                    .foregroundColor(animate ? .black : .blue)
            }
            .disabled(animate)
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) {_ in
                self.time += 0.01
                if self.offsetY >= -210 {
                    if self.animate {
                        withAnimation(Animation.linear(duration: 0.03)) {
                            self.offsetY -= 1.5
                        }
                    }
                } else {
                    self.label = "Done"
                }
            }
        }
    }
}

struct LoaderRectView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderRectView()
    }
}
