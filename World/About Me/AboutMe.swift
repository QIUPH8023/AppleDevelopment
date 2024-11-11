//
//  AboutMe.swift
//  World
//
//  Created by 仇鹏皓 on 2024/11/9.
//  Copyright © 2024 Apple. All rights reserved.
//

/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The AboutMe content for a volume.
*/

import SwiftUI
import AVKit

/// The AboutMe content for a volume.
struct AboutMe: View {
    @Environment(ViewModel.self) private var model
    @State private var player: AVPlayer? // AVPlayer 实例

    let name: String = "QIU Penghao"
    let introduction: String = "I am a software developer with a passion for creating innovative solutions."

    var body: some View {
        VStack {
            Text(name)
                .font(.largeTitle)
                .padding()

            Text(introduction)
                .font(.body)
                .padding()

            // 视频播放视图
            if let player = player {
                GeometryReader { geometry in
                    VideoPlayer(player: player)
                        .onAppear {
                            player.play() // 自动播放视频
                        }
                        .aspectRatio(contentMode: .fill) // 填充以避免黑边
                        .frame(width: geometry.size.width, height: geometry.size.height) // 设置视频播放区域的大小
                }
                .frame(height: 1000) // 设置视频播放区域的高度
                .clipped() // 确保超出部分被裁剪
            } else {
                Text("Loading video...")
                    .padding()
            }
        }
        .padding()
        .navigationTitle("About Me")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            // 使用 AVAsset 从 Assets.xcassets 加载视频
            if let url = Bundle.main.url(forResource: "SampleVideo", withExtension: "mp4") {
                player = AVPlayer(url: url)
            } else {
                print("Video file not found.")
            }
        }
    }
}

#Preview {
    AboutMe()
        .environment(ViewModel())
}
