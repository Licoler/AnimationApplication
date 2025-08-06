//
//  Animation.swift
//  InfoAnimationApp
//
//  Created by Альбек Халапов on 06.08.2025.
//

import CoreGraphics
import SpringAnimation

struct Animation {
    let preset: String
    let curve: String
    let force: CGFloat
    let duration: CGFloat
    let delay: CGFloat

    static func generateRandom() -> Animation {
        Animation(
            preset: AnimationPreset.allCases.randomElement()?.rawValue ?? "pop",
            curve: AnimationCurve.allCases.randomElement()?.rawValue ?? "easeIn",
            force: CGFloat.random(in: 0.5...2.0),
            duration: CGFloat.random(in: 0.5...1.5),
            delay: CGFloat.random(in: 0.1...0.5)
        )
    }
}

