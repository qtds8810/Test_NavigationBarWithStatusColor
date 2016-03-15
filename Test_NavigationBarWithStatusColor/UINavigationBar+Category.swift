//
//  UINavigationBar+Category.swift
//  ZhaoYouBao
//
//  Created by zhaoyou on 16/3/15.
//  Copyright © 2016年 zhaoyouwang. All rights reserved.
//

import UIKit

private var key: String = "coverView"

extension UINavigationBar {
    
    /// 定义一个计算属性，如果可以我更希望直接顶一个存储属性。它用来返回和设置我们需要加到UINavigationBar上的View
    var coverView: UIView? {
        get {
            //这句的意思大概可以理解为利用key在self中取出对应的对象,如果没有key对应的对象就返回nil
            return objc_getAssociatedObject(self, &key) as? UIView
        }
        set {
            //与上面对应是重新设置这个对象，最后一个参数如果学过oc的话很好理解，就是代表这个newValue的属性
            //OBJC_ASSOCIATION_RETAIN_NONATOMIC意味着:strong,nonatomic
            objc_setAssociatedObject(self , &key, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
     /**
     设置背景色
     */
    func customMyBackgroundColor(color: UIColor) {
        if coverView != nil {
            coverView?.backgroundColor = color
        } else {
            setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
            shadowImage = UIImage()
            
            let bgView = UIView(frame: CGRect(origin: CGPoint(x: 0, y: -20), size: CGSize(width: UIScreen.mainScreen().bounds.size.width, height: bounds.height + 20)))
            bgView.userInteractionEnabled = false
            bgView.autoresizingMask = [UIViewAutoresizing.FlexibleHeight, UIViewAutoresizing.FlexibleWidth]
            insertSubview(bgView, atIndex: 0)
            
            bgView.backgroundColor = color
            coverView = bgView
        }
    }
    
     /**
     设置透明度
     */
    func customMyBackgroundColorAlpha(alpha: CGFloat) {
        guard let coverView = coverView else {
            return
        }
        coverView.backgroundColor = coverView.backgroundColor?.colorWithAlphaComponent(alpha)
    }
}
