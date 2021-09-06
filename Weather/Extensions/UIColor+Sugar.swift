//
//  UIColor+Sugar.swift
//  ChatApp
//
//  Created by Ivan Zakharov on 9/3/21.
//

import UIKit

public extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat = 1.0) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
}
