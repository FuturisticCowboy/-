//
//  UIViewAnimationController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class UIViewAnimationController: UIViewController {
    
    @IBOutlet weak var animationView: UIView!
    @IBOutlet weak var flipButton: UIButton!
    
    @IBAction func animationViewTapHandler(sender: UITapGestureRecognizer) {
        animation()
    }
    
    @IBAction func flipButtonTapHandler(sender: UIButton) {
        bigAnimation()
    }
    
    //MARK: - Animations
    private func animation(){
        UIView.animate(withDuration: 1.0, delay: 1.0, options: .curveEaseInOut, animations: {
            self.animationView.center = CGPoint(x: self.animationView.center.x + 364, y: self.animationView.center.y)
            self.animationView.transform = CGAffineTransform(rotationAngle: (180 * .pi)/180)
        })
    }
    
    private func bigAnimation(){
        UIView.animate(withDuration: 1.0, delay: 1.0, options: .curveEaseInOut, animations: {
            self.view.transform = self.view.transform.rotated(by: .pi)
        })
        UIView.animate(withDuration: 1.0, delay: 1.0, options: .curveEaseInOut, animations: {
            self.flipButton.transform = self.flipButton.transform.rotated(by: .pi)
            
        })
    }
}
