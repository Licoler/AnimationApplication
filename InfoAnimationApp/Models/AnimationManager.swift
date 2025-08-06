//
//  AnimationManager.swift
//  InfoAnimationApp
//
//  Created by Альбек Халапов on 06.08.2025.
//

final class AnimationManager {
    private var animations: [Animation] = []
    private var index = 0

    func next() -> Animation {
        if index >= animations.count {
            animations = generateAnimationBatch()
            index = 0
        }

        let animation = animations[index]
        index += 1
        return animation
    }

    private func generateAnimationBatch(count: Int = 10) -> [Animation] {
        (0..<count).map { _ in Animation.generateRandom() }
    }
}
