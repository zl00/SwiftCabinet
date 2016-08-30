//
//  UIFont+Extension.swift
//  SwiftCabinet
//
//  Created by Linda Zhong on 8/30/16.
//  Copyright © 2016 Linda Zhong. All rights reserved.
//

import UIKit

extension UIFont {
    func fontRef() -> CTFontRef {
        return CTFontCreateWithName(self.fontName, self.pointSize, nil)
    }
}
