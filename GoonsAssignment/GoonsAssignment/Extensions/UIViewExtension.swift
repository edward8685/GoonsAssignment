//
//  UIViewExtension.swift
//  GoonsAssignment
//
//  Created by Ed Chang on 2022/1/8.
//

import UIKit

extension UIView {
    
    enum RoundCornerType {
        case leftTop
        case rightTop
    }
    
    func roundCorner(cornerRadius: Double, type: RoundCornerType) {
        
        self.layer.cornerRadius = CGFloat(cornerRadius)
        
        self.layer.masksToBounds = true
        
        switch type {
            
        case .leftTop:
            
            self.layer.maskedCorners = [ .layerMinXMinYCorner ]
            
        case .rightTop:
            
            self.layer.maskedCorners = [ .layerMaxXMinYCorner ]
        }
    }
}


