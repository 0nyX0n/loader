//
//  DownloadButtonView.swift
//  Loader
//
//  Created by Jérémy Supplis on 09/06/2020.
//  Copyright © 2020 Jérémy Supplis. All rights reserved.
//

import SwiftUI

struct DownloadButtonView: View {
    
    // Properties
    @Binding var label: String
    @Binding var animate: Bool
    
    // Internal properties
    private var color: Color { get { animate ? Color(UIColor.init(named: "downloadingColor") ?? UIColor.black) : .blue } }
    
    var body: some View {
        Button(action: {
            self.animate.toggle()
            self.label = DownLoadState.progess.rawValue
        }) {
            Text(label)
                .font(.largeTitle)
                .foregroundColor(color)
        }
        .disabled(animate)
    }
}

#if DEBUG
struct DownloadButtonView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadButtonView(label: .constant(DownLoadState.start.rawValue), animate: .constant(false))
    }
}
#endif
