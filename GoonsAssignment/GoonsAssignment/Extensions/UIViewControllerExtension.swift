//
//  UIViewControllerExtension.swift
//  GoonsAssignment
//
//  Created by Ed Chang on 2022/1/10.
//

import UIKit

extension UIViewController {
    
    var width: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    var height: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    var statusBarframe: CGRect {
        return navigationController?.navigationBar.frame ?? CGRect.zero
    }

    var topbarHeight: CGFloat {
        return (view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0) + statusBarframe.height
    }
}
