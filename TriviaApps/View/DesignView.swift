//
//  DesignView.swift
//  TriviaApps
//
//  Created by DSMacbook on 27/10/19.
//  Copyright © 2019 DSMacbook. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class DesignView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 0
    @IBInspectable var shadowColor: UIColor? = UIColor.black
    @IBInspectable let shadowOffSetWidth: Int = 0
    @IBInspectable let shadowOffSetHeight: Int = 0
    
    @IBInspectable let shadowOpacity: Float = 0.2
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffSetWidth, height: shadowOffSetHeight)
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = shadowOpacity
    }
}
