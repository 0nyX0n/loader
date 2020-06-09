//
//  RectFluidShape.swift
//  Loader
//
//  Created by Jérémy Supplis on 09/06/2020.
//  Copyright © 2020 Jérémy Supplis. All rights reserved.
//

import SwiftUI

struct RectFluidShape: Shape {
    
    var time: CGFloat
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            let curveHeight: CGFloat = 8
            path.move(to: CGPoint(x: 100, y: 800))
            path.addLine(to: CGPoint(x: 0, y: 800))
            for i in stride(from: 0, to: CGFloat(rect.width), by: 1) {
                path.addLine(to:
                    CGPoint(x: i,
                            y: sin(
                                ((i / rect.height) + time) * 4 * .pi) * curveHeight + rect.midY)
                )
            }
            path.addLine(to: CGPoint(x: 100, y: 800))
        }
    }
}

struct RectFluidShape_Previews: PreviewProvider {
    static var previews: some View {
        RectFluidShape(time: 1)
    }
}
