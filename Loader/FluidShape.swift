//
//  FluidShape.swift
//  Loader
//
//  Created by Jérémy Supplis on 09/06/2020.
//  Copyright © 2020 Jérémy Supplis. All rights reserved.
//

import SwiftUI

struct FluidShape: Shape {
    
    // Properties
    var time: CGFloat
    let shape: DownLoadShape
    
    // Internal properties
    private let startingPoint: CGFloat = 0
    private var curveHeight: CGFloat { get { shape == .circle ? 10 : 8 } }
    private var curveLenght: CGFloat { get { shape == .circle ? 1.5 : 4 } }
    private var endingPoint: CGFloat { get { shape == .circle ? 500 : 800 } }
    private var movingPoint: CGFloat { get { shape == .circle ? 250 : 100 } }
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: movingPoint, y: endingPoint))
            path.addLine(to: CGPoint(x: startingPoint, y: endingPoint))
            stride(from: startingPoint, to: CGFloat(rect.width), by: 1).forEach {
                path.addLine(to: CGPoint(x: $0, y: sin((($0 / rect.height) + time) * curveLenght * .pi) * curveHeight + rect.midY))
            }
            path.addLine(to: CGPoint(x: movingPoint, y: endingPoint))
        }
    }
}

#if DEBUG
struct FluidShape_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FluidShape(time: 1, shape: .circle)
            FluidShape(time: 1, shape: .rect)
        }
    }
}
#endif
