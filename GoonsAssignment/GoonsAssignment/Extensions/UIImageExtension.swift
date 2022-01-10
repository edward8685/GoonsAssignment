//
//  UIImageExtension.swift
//  GoonsAssignment
//
//  Created by Ed Chang on 2022/1/10.
//

import UIKit

enum ImageAsset: String {

    case dog
    case back = "icons8-back-24"
}

extension UIImage {

    static func asset(_ asset: ImageAsset) -> UIImage? {

        return UIImage(named: asset.rawValue)
    }
}
