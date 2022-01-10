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
    
    var navBarFrame: CGRect {
        return navigationController?.navigationBar.frame ?? CGRect.zero
    }
    
    var statusBarFrame: CGRect {
        return view.window?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero
    }

    var topbarHeight: CGFloat {
        return statusBarFrame.height + navBarFrame.height
    }
}
