//
//  LoaderRectView.swift
//  Loader
//
//  Created by Jérémy Supplis on 09/06/2020.
//  Copyright © 2020 Jérémy Supplis. All rights reserved.
//

import SwiftUI

struct LoaderRectView: View {
    
    // Internal properties
    @State private var time: Double = 0
    @State private var offsetY: CGFloat = 210.0
    @State private var animate = false
    @State private var label = DownLoadState.start.rawValue
    
    var body: some View {
        NavigationView {
            VStack {
                DownloadShapeView(time: $time, offsetY: $offsetY, shape: .rect)
                DownloadButtonView(label: $label, animate: $animate)
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
                        self.label = DownLoadState.done.rawValue
                    }
                }
            }
        }
    }
}

#if DEBUG
struct LoaderRectView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderRectView()
    }
}
#endif
