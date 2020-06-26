//
//  Constants.swift
//  Loader
//
//  Created by Jérémy Supplis on 09/06/2020.
//  Copyright © 2020 Jérémy Supplis. All rights reserved.
//

import Foundation

// All states during the loading
enum DownLoadState: String {
    case start = "Downloading"
    case progess = "Downloading..."
    case done = "Done"
}

// All loader shape
enum DownLoadShape {
    case circle
    case rect
}
