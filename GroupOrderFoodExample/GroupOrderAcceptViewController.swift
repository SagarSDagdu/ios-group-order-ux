//
//  GroupOrderAcceptViewController.swift
//  GroupOrderFoodExample
//
//  Created by Sagar Dagdu on 24/08/24.
//

import UIKit
import LinkPresentation

struct OrderDetails {
    let userName: String
    let restaurantName: String
}

class GroupOrderAcceptViewController: UIViewController {
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var emojisLabel: UILabel!
    @IBOutlet weak var letsGoButton: UIButton!
    @IBOutlet weak var noThanksButton: UIButton!
    
    var orderDetails: OrderDetails?
    
    private let emojis = ["🍕", "🍔", "🍟", "🌭", "🍩", "🍪", "🍫", "🥤", "🍿", "🧁"]
    private var currentEmojiIndex = 0
    private var displayLink: CADisplayLink?
    private var lastUpdateTime: CFTimeInterval = 0
    private let updateInterval: CFTimeInterval = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        startEmojiAnimation()
        letsGoButton.layer.cornerRadius = 8.0
        noThanksButton.layer.cornerRadius = 8.0
        
        if let orderDetails = orderDetails {
            contentLabel.text = "\(orderDetails.userName) has invited you to join a group, to order delicious food from \(orderDetails.restaurantName)."
        } else {
            contentLabel.text = "You have been invited to join a group to order delicious food."
        }
    }
    
    @IBAction func letsGoClicked(_ sender: Any) {
        dismiss(animated: true)
    }

    @IBAction func noThanksClicked(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @objc func updateEmoji(displayLink: CADisplayLink) {
        let currentTime = displayLink.timestamp
        guard currentTime - lastUpdateTime >= updateInterval else { return }
        
        animateEmojiChange()
        lastUpdateTime = currentTime
    }
    
    private func startEmojiAnimation() {
        displayLink = CADisplayLink(target: self, selector: #selector(updateEmoji))
        displayLink?.add(to: .main, forMode: .common)
    }
    
    private func animateEmojiChange() {
        UIView.transition(with: emojisLabel, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.emojisLabel.text = self.emojis[self.currentEmojiIndex]
        }, completion: nil)
        
        currentEmojiIndex = (currentEmojiIndex + 1) % emojis.count
    }
    
    deinit {
        displayLink?.invalidate()
    }
}
