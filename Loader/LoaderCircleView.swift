//
//  LoaderCircleView.swift
//  Loader
//
//  Created by Jérémy Supplis on 09/06/2020.
//  Copyright © 2020 Jérémy Supplis. All rights reserved.
//

import SwiftUI

struct LoaderCircleView: View {
    
    // Internal properties
    @State private var time: Double = 0
    @State private var offsetY: CGFloat = 140.0
    @State private var animate = false
    @State private var label = DownLoadState.start.rawValue
    
    var body: some View {
        NavigationView {
            VStack {
                DownloadShapeView(time: $time, offsetY: $offsetY, shape: .circle)
                DownloadButtonView(label: $label, animate: $animate)
            }
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 0.015, repeats: true) {_ in
                    self.time += 0.01
                    if self.offsetY >= -140 {
                        if self.animate {
                            withAnimation(Animation.linear(duration: 0.03)) {
                                self.offsetY -= 0.5
                            }
                        }
                    } else {
                        self.label = DownLoadState.done.rawValue
                    }
                }
            }
        }
    }
}

#if DEBUG
struct LoaderCircleView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderCircleView()
    }
}
#endif
