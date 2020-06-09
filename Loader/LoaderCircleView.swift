//
//  LoaderCircleView.swift
//  Loader
//
//  Created by Jérémy Supplis on 09/06/2020.
//  Copyright © 2020 Jérémy Supplis. All rights reserved.
//

import SwiftUI

let lightBlue = Color(UIColor(red: 0.35, green: 0.80, blue: 0.93, alpha: 1.00))
let gradient = LinearGradient(gradient: Gradient(colors: [Color(.blue), lightBlue]), startPoint: .top, endPoint: .bottom)

struct LoaderCircleView: View {
    
    @State var time: Double = 0
    @State private var offsetY: CGFloat = 140.0
    @State private var animate = false
    @State private var label = "Downloading"
    
    var body: some View {
        VStack {
            ZStack {
                CircleFluidShape(time: CGFloat(time + 0.2))
                    .fill(lightBlue)
                    .frame(width: 250, height: 250)
                
                CircleFluidShape(time: CGFloat(time))
                    .fill(gradient)
                    .opacity(0.5)
                    .frame(width: 250, height: 250)
            }
            .offset(x: 0, y: offsetY)
            .mask(Circle().frame(width: 250, height: 250))
            
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
            Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) {_ in
                self.time += 0.01
                if self.offsetY >= -140 && self.animate {
                    withAnimation(Animation.linear(duration: 0.03)) {
                        self.offsetY -= 0.5
                    }
                } else {
                    self.label = "Done"
                }
            }
        }
    }
}

struct LoaderCircleView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderCircleView()
    }
}
