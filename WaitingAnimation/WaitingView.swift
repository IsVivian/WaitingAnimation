//
//  WaitingView.swift
//  WaitingAnimation
//
//  Created by sherry on 16/10/18.
//  Copyright © 2016年 sherry. All rights reserved.
//

import UIKit

enum WaingType {
    case WaitingTree
    case WaitintRound
}

class WaitingView: UIView {

    var backViewColor: UIColor!
    var dotColor: UIColor!
    
    var width: CGFloat = 0
    
    func showInView(view: UIView) {
    
        if view.frame.size.width < view.frame.size.height {
            width = view.frame.size.width
        }else {
            width = view.frame.size.height
        }
    
        self.frame = CGRectMake(view.frame.size.width/2-width/8, view.frame.size.height/2-width/8, width/4, width/4)
        self.backgroundColor = UIColor.clearColor()
        
        creatWaitThree()
        
        view.addSubview(self)
    
    }
    
    //添加点
    func creatWaitThree() {
        
        //CAReplicatorLayer创建的子类可以复用
        let rep = CAReplicatorLayer()
        rep.bounds = self.bounds
        rep.cornerRadius = 10.0
        rep.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
        rep.backgroundColor = self.backViewColor.CGColor
        self.layer.addSublayer(rep)
   
        let dotLayer = CALayer()
        dotLayer.bounds = CGRectMake(0, 0, self.frame.size.width/6, self.frame.size.height/6)
        dotLayer.position = CGPointMake(self.frame.size.width/6, self.frame.size.height/2)
        dotLayer.backgroundColor = self.dotColor.CGColor
        dotLayer.cornerRadius = self.frame.size.width/12
        rep.addSublayer(dotLayer)
        
        //设置子类的个数
        rep.instanceCount = 3
        //设置每个子layer平移
        rep.instanceTransform = CATransform3DMakeTranslation(self.frame.size.width/3, 0, 0)
        
        //添加动画
        /*
         动画的keyPath:
         transform.rotation：旋转动画。
         transform.rotation.x：按x轴旋转动画。
         transform.rotation.y：按y轴旋转动画。
         transform.rotation.z：按z轴旋转动画。
         transform.scale：按比例放大缩小动画。
         transform.scale.x：在x轴按比例放大缩小动画。
         transform.scale.y：在y轴按比例放大缩小动画。
         transform.scale.z：在z轴按比例放大缩小动画。
         position：移动位置动画。
         opacity：透明度动画
         */
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.duration = 1.0
        animation.fromValue = 1
        animation.toValue = 0
        animation.repeatCount = MAXFLOAT
        
        dotLayer.addAnimation(animation, forKey: nil)
        
        //设置instanceDelay，达到每个子layer逐一变化的效果
        rep.instanceDelay = 1.0/3
        
        dotLayer.transform = CATransform3DMakeScale(0, 0, 0)
        
    }

}
