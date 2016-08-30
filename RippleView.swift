//
//  RippleView.swift
//  SwiftCabinet
//
//  Created by Linda Zhong on 8/30/16.
//  Copyright © 2016 Linda Zhong. All rights reserved.
//

import UIKit

protocol RippleShimmerProtocol {
    func onShimmer(path: CGPath, ripple: RippleView) -> Void
}

class RippleView: UIView {
    
    var rippleColor: UIColor = UIColor.cyanColor()
    var rippleY: Double = 50.0
    var rippleX: Double = 320.0
    
    var a: Double = 1.5
    var b: Double = 0
    var jia: Bool = false
    
    var rippleDelegate: RippleShimmerProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() -> Void {
        self.backgroundColor = UIColor.clearColor()
        NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: #selector(shimmering), userInfo: nil, repeats: true)
    }
    
    @objc private func shimmering() -> Void {
        a += jia ? 0.01 : -0.01;
        if a <= 1 { jia = true }
        if a >= 1.5 { jia = false }
        b += 0.1
        setNeedsDisplay()
    }
    
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        let path = CGPathCreateMutable()
        
        CGContextSetLineWidth(context, 1)
        rippleColor.CGColor
        CGContextSetFillColorWithColor(context, rippleColor.CGColor)
    
        CGPathMoveToPoint(path, nil, 0, CGFloat(rippleY))
        
        var x: Double = 0.0, y: Double = 0.0
        repeat {
            y = a * sin(x / 180.0 * M_PI + 4 * b / M_PI) * 5 + rippleY
            CGPathAddLineToPoint(path, nil, CGFloat(x), CGFloat(y))
            x += 1
        } while(x < rippleX)
        
        CGPathAddLineToPoint(path, nil, CGFloat(rippleX), rect.size.height)
        CGPathAddLineToPoint(path, nil, CGFloat(0), rect.size.height)
        CGPathAddLineToPoint(path, nil, CGFloat(0), CGFloat(rippleY))
        
        CGContextAddPath(context, path)
        CGContextFillPath(context)
        CGContextDrawPath(context, .Stroke)
        
        self.rippleDelegate?.onShimmer(path, ripple: self)
    }
}
