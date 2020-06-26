//
//  DownloadShapeView.swift
//  Loader
//
//  Created by Jérémy Supplis on 12/06/2020.
//  Copyright © 2020 Jérémy Supplis. All rights reserved.
//

import SwiftUI

struct DownloadShapeView: View {
    
    // Properties
    @Binding var time: Double
    @Binding var offsetY: CGFloat
    var shape: DownLoadShape
    
    // Internal properties
    private var width: CGFloat { get { shape == .circle ? 250 : 100 } }
    private var height: CGFloat { get { shape == .circle ? 250 : 400 } }
    private var timer: CGFloat { get { CGFloat(shape == .circle ? (time + 0.2) : (time * 1.2)) } }
    
    var body: some View {
        ZStack {
            Capsule()
                .frame(width: width, height: height)
                .foregroundColor(.white)
                .shadow(radius: 5)
            
            ZStack {
                FluidShape(time: timer, shape: shape)
                    .fill(shape == .circle ? Color.lightBlue : .lightGreen)
                    .frame(width: width, height: height)
                
                FluidShape(time: CGFloat(time), shape: shape)
                    .fill(shape == .circle ? Color.gradientBlue : Color.gradientGreen)
                    .opacity(0.5)
                    .frame(width: width, height: height)
            }
            .offset(x: 0, y: offsetY)
            .mask(Capsule().frame(width: width, height: height))
        }
    }
}


struct DownloadShapeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DownloadShapeView(time: .constant(0), offsetY: .constant(140), shape: .circle)
            DownloadShapeView(time: .constant(0), offsetY: .constant(210), shape: .rect)
        }
    }
}
