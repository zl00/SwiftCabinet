//
//  UIViewController+Extension.swift
//  SwiftCabinet
//
//  Created by Linda Zhong on 8/30/16.
//  Copyright © 2016 Linda Zhong. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func isVisible() -> Bool {
        
        return self.isViewLoaded() && (self.view.window != nil)
    }
}
