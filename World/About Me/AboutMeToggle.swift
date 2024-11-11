//
//  AboutMeToggle.swift
//  World
//
//  Created by 仇鹏皓 on 2024/11/9.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI

/// A toggle that activates or deactivates the About Me volume.
struct AboutMeToggle: View {
    @Environment(ViewModel.self) private var model
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow

    var body: some View {
        @Bindable var model = model

        Toggle(Module.aboutme.callToAction, isOn: $model.isShowingAboutMe)
            .onChange(of: model.isShowingAboutMe) { _, isShowing in
                if isShowing {
                    openWindow(id: "AboutMe")
                } else {
                    dismissWindow(id: "AboutMe")
                }
            }
            .toggleStyle(.button)
    }
}

#Preview {
    AboutMeToggle()
        .environment(ViewModel())
}
