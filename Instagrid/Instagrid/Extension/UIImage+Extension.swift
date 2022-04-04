//
//  UIImage+Extension.swift
//  Instagrid
//
//  Created by Giovanni Gabriel on 04/04/2022.
//

import UIKit

extension UIImage {
    convenience init(view: UIView) {
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.isOpaque, 0.0)
    view.drawHierarchy(in: view.bounds, afterScreenUpdates: false)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    self.init(cgImage: (image?.cgImage)!)
    }
}
