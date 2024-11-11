//
//  AboutMeSettings.swift
//  World
//
//  Created by 仇鹏皓 on 2024/11/10.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI
import AVKit

/// Debug setting controls for the About Me module.
struct AboutMeSettings: View {
    @Environment(ViewModel.self) private var model
    @State private var showVideoPlayer = false // 控制视频播放视图的展示

    var body: some View {
        @Bindable var model = model

        VStack {
            Text("About Me module debug settings")
                .font(.title)
            Form {
                Section(String(localized: "Personal Information")) {
                    TextField("Name", text: $model.aboutMeName)
                    TextField("Introduction", text: $model.aboutMeIntroduction)
                }
                
                Section(String(localized: "System")) {
                    Grid(alignment: .leading, verticalSpacing: 20) {
                        Button {
                            model.aboutMeName = "Default Name"
                            model.aboutMeIntroduction = "This is the default introduction."
                        } label: {
                            Text("Reset")
                        }

                    }
                }
            }
        }
        .padding()
        
    }
}


#Preview {
    AboutMeSettings()
        .frame(width: 500)
        .environment(ViewModel())
}
