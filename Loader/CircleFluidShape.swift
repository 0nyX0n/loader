//
//  CircleFluidShape.swift
//  Loader
//
//  Created by Jérémy Supplis on 09/06/2020.
//  Copyright © 2020 Jérémy Supplis. All rights reserved.
//

import SwiftUI

struct CircleFluidShape: Shape {
    
    var time: CGFloat
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            let curveHeight: CGFloat = 10
            let curveLenght: CGFloat = 1.5
            path.move(to: CGPoint(x: 250, y: 500))
            path.addLine(to: CGPoint(x: 0, y: 500))
            for i in stride(from: 0, to: CGFloat(rect.width), by: 1) {
                path.addLine(to:
                    CGPoint(x: i,
                            y: sin(
                                ((i / rect.height) + time) * curveLenght * .pi) * curveHeight + rect.midY)
                )
            }
            path.addLine(to: CGPoint(x: 250, y: 500))
        }
    }
}

struct CircleFluidShape_Previews: PreviewProvider {
    static var previews: some View {
        CircleFluidShape(time: 5.0)
    }
}
