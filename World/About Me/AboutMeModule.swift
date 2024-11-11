//
//  AboutMeModule.swift
//  World
//
//  Created by 仇鹏皓 on 2024/11/9.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI
import AVKit

/// The module detail content that's specific to the about me module.
struct AboutMeModule: View {

    var body: some View {
        VStack {
            Image("MyPicture")
                .resizable()
                .scaledToFit()
        }
    }
}
