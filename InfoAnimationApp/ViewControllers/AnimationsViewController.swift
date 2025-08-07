//
//  ViewController.swift
//  InfoAnimationApp
//
//  Created by Альбек Халапов on 23.07.2025.
//

import UIKit
import SpringAnimation

final class AnimationsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var presetLabel: UILabel!
    @IBOutlet var curveLabel: UILabel!
    @IBOutlet var forceLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var delayLabel: UILabel!
    
    @IBOutlet var springAnimationView: SpringView!
    @IBOutlet var actionButton: UIButton!
    
    // MARK: - Private Properties
    private var nextAnimation = Animation.generateRandom()
    private var isFirstRun = true
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(with: nextAnimation)
        actionButton.setTitle("Run", for: .normal)
    }
    
    // MARK: - IBActions
    @IBAction func switchingAnimations(_ sender: UIButton) {
        let animationToRun = nextAnimation
        apply(animation: animationToRun)
        springAnimationView.animate()
        updateUI(with: animationToRun)

        nextAnimation = Animation.generateRandom()
                
        let nextTitle = "Run \(nextAnimation.preset)"
        actionButton.setTitle(nextTitle, for: .normal)
    }
    
    // MARK: - Private Methods
    private func apply(animation: Animation) {
        springAnimationView.animation = animation.preset
        springAnimationView.curve = animation.curve
        springAnimationView.force = animation.force
        springAnimationView.duration = animation.duration
        springAnimationView.delay = animation.delay
    }
    
    private func updateUI(with animation: Animation) {
        presetLabel.text = "Preset: \(animation.preset)"
        curveLabel.text = "Curve: \(animation.curve)"
        forceLabel.text = String(format: "Force: %.2f", animation.force)
        durationLabel.text = String(format: "Duration: %.2f", animation.duration)
        delayLabel.text = String(format: "Delay: %.2f", animation.delay)
    }
}
