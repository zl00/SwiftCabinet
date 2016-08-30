//
//  RippleText.swift
//  SwiftCabinet
//
//  Created by Linda Zhong on 8/30/16.
//  Copyright © 2016 Linda Zhong. All rights reserved.
//

import UIKit

class RippleText: UIView {
    
    var text: String = "hello world"
    var font: UIFont = UIFont.boldSystemFontOfSize(100)
    
    private let maskLayer: CAShapeLayer = CAShapeLayer()
    
    
}

extension RippleText: RippleShimmerProtocol {
    
    internal func onShimmer(path: CGPath, ripple: RippleView) -> Void {
        let underRippleText = createTextLayer(text: text)
        let upRippleText = createTextLayer(text: text)
        underRippleText.foregroundColor = ripple.rippleColor.CGColor
        underRippleText.addSublayer(upRippleText)
        
        maskLayer.path = path
        upRippleText.mask = maskLayer
        
        self.layer.sublayers = nil
        self.layer.addSublayer(underRippleText)
    }
    
    internal func createTextLayer(text text: String) -> CATextLayer {
        let textLayer = CATextLayer()
        textLayer.frame = self.bounds
        textLayer.string = text
        textLayer.font = font.fontRef()
        textLayer.fontSize = font.pointSize
        
        textLayer.foregroundColor = UIColor.whiteColor().CGColor
        textLayer.contentsScale = UIScreen.mainScreen().scale
        textLayer.backgroundColor = UIColor.clearColor().CGColor
        return textLayer
    }
}
