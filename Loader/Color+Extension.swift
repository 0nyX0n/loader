//
//  Color+Extension.swift
//  Loader
//
//  Created by Jérémy Supplis on 09/06/2020.
//  Copyright © 2020 Jérémy Supplis. All rights reserved.
//

import Foundation
import SwiftUI

extension Color {
    static let lightGreen = Color(UIColor(red: 0.44, green: 0.93, blue: 0.72, alpha: 1.00))
    static let lightBlue = Color(UIColor(red: 0.35, green: 0.80, blue: 0.93, alpha: 1.00))
    static let gradientBlue = LinearGradient(gradient: Gradient(colors: [Color(.blue), lightBlue]), startPoint: .top, endPoint: .bottom)
    static let gradientGreen = LinearGradient(gradient: Gradient(colors: [Color(.green), lightGreen]), startPoint: .top, endPoint: .bottom)
}
