//
//  UIKitDynamicController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit
//не смог справиться с этим заданием

class UIKitDynamicController: UIViewController {
    
    @IBOutlet weak var anchorView: UIView!
    @IBOutlet weak var animationView: UIView!
    
    var animator = UIDynamicAnimator()
    var attachmentBehavior = UIAttachmentBehavior()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createBehavior()
    }
    
    func createBehavior(){
        animator = UIDynamicAnimator(referenceView: animationView)
        let gravity = UIGravityBehavior(items: [animationView])
        attachmentBehavior = UIAttachmentBehavior.fixedAttachment(with: animationView, attachedTo: anchorView, attachmentAnchor: anchorView.center)
        
//        let item = UIDynamicItemBehavior(items: [animationView])
//        item.elasticity = 0.5
        let collision = UICollisionBehavior(items: [animationView])
        collision.translatesReferenceBoundsIntoBoundary = true
                
        animator.addBehavior(gravity)
        animator.addBehavior(attachmentBehavior)
//        animator.addBehavior(item)
        animator.addBehavior(collision)
    }
    
    @IBAction func panGesture(_ sender: UIPanGestureRecognizer) {
        let tapPoint = sender.location(in: view)
        attachmentBehavior.anchorPoint = tapPoint
        anchorView.center = anchorView.layer.position
    }
}
