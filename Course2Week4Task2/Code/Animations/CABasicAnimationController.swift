//
//  ViewController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class CABasicAnimationController: UIViewController {
    
    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var cyanView: UIView!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var greenView: UIView!
    
    //MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let orangeTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(orangeTapGesture(_:)))
        let cyanTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(cyanTapGesture(_:)))
        let blueTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(blueTapGesture(_:)))
        let greenTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(greenTapGesture(_:)))
        orangeView.addGestureRecognizer(orangeTapGestureRecognizer)
        cyanView.addGestureRecognizer(cyanTapGestureRecognizer)
        blueView.addGestureRecognizer(blueTapGestureRecognizer)
        greenView.addGestureRecognizer(greenTapGestureRecognizer)
        }
    
    
    //MARK: - @objc Actions
    
    @objc private func orangeTapGesture(_ recognizer: UITapGestureRecognizer){
        orange()
    }
    
    @objc private func blueTapGesture(_ recognizer: UITapGestureRecognizer){
        blue()
    }
    
    @objc private func cyanTapGesture(_ recognizer: UITapGestureRecognizer){
        cyan()
    }
    
    @objc private func greenTapGesture(_ recognizer: UITapGestureRecognizer){
        green()
    }
    
    //MARK: - Orange Animations
    
    private func orange(){
        let value: CGFloat = 50
        let orangeAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.cornerRadius))
        orangeAnimation.duration = 1.0
        orangeAnimation.timingFunction = CAMediaTimingFunction(name:  CAMediaTimingFunctionName.easeOut)
        orangeAnimation.fromValue = orangeView.layer.cornerRadius
        orangeAnimation.toValue = value
        orangeView.layer.add(orangeAnimation, forKey: "recting")
        orangeView.layer.cornerRadius = value
    }
    
    //MARK: - Cyan Animations
    
    private func cyan(){
        let cyanAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        cyanAnimation.duration = 1.0
        cyanAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
        cyanAnimation.fromValue = cyanView.layer.opacity
        cyanAnimation.toValue = 0
        cyanView.layer.add(cyanAnimation, forKey: "disappear")
        cyanView.layer.opacity = 0
    }

    //MARK: - Blue Animations
    
    private func blue(){
        let group = CAAnimationGroup()
        let startPos = blueView.center
        let endPos = CGPoint(x: cyanView.center.x, y: blueView.center.y)
        let bluePosAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.position))
        let blueRotAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        
        bluePosAnimation.fromValue = startPos
        bluePosAnimation.toValue = endPos
        
        blueRotAnimation.fromValue = 0*Double.pi/180
        blueRotAnimation.toValue = 315*Double.pi/180
        blueView.transform = CGAffineTransform(rotationAngle: (315 * .pi)/180)
            
        
        group.animations = [bluePosAnimation, blueRotAnimation]
        group.duration = 2.0
        group.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        blueView.layer.add(group, forKey: nil)
        blueView.layer.position = endPos
    }
    
    //MARK: - Green Animations
    
    private func green(){
        let group = CAAnimationGroup()
        let startPos = greenView.center
        let endPos = view.center
        let greenPosAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.position))
        let greenBoundsAnimation = CABasicAnimation(keyPath: "transform.scale")
        let greenColorAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.backgroundColor))
        
        greenPosAnimation.fromValue = startPos
        greenPosAnimation.toValue = endPos
        
//        change keypath to #keyPath(CALayer.bounds)
//        greenBoundsAnimation.fromValue = CGRect(origin: greenView.center, size: greenView.bounds.size)
//        greenBoundsAnimation.toValue = CGRect(origin: view.center, size: CGSize(width: 150.0, height: 150.0))
        greenBoundsAnimation.fromValue = 1.0
        greenBoundsAnimation.toValue = 1.5
        
        greenColorAnimation.fromValue = greenView.layer.backgroundColor
        greenColorAnimation.toValue = UIColor.magenta.cgColor
        
        group.animations = [greenPosAnimation, greenBoundsAnimation, greenColorAnimation]
        group.duration = 1.0
        group.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        group.repeatCount = 2
        group.autoreverses = true
        greenView.layer.add(group, forKey: nil)
//        greenView.layer.add(greenBoundsAnimation, forKey: nil)
    }
}
