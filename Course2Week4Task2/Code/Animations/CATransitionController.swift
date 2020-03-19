//
//  CATransitionController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class CATransitionController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!

    @IBAction func swipeHandler(_ sender: UISwipeGestureRecognizer){
        let transAnimation = CATransition()
        
        transAnimation.duration = 1.0
        transAnimation.delegate = self
        transAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        transAnimation.type = CATransitionType.moveIn
        textLabel.layer.add(transAnimation, forKey: nil)
        textLabel.text = "Sliding!"
        textLabel.textColor = .green
    }
    
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//          textLabel.layer.trans2()
//          textLabel.text = "Initial text"
//          textLabel.textColor = .orange
//    }
}

extension CATransitionController: CAAnimationDelegate{
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        guard flag else { return }
        
        textLabel.layer.trans2()
        textLabel.text = "Initial text"
        textLabel.textColor = .orange
    }
}

extension CALayer{
    
    func trans2(){
        let transAnimation = CATransition()
        
        transAnimation.duration = 1.0
        transAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        transAnimation.type = CATransitionType.fade

        self.add(transAnimation, forKey: nil)
    }
}
