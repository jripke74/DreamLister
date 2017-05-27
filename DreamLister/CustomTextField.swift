//
//  CustomTextField.swift
//  DreamLister
//
//  Created by Jeff Ripke on 5/26/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

import UIKit

// extension to UIColor to allow setting the color value by hex value
extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        // verify that we have valid vlues
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(green) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex: Int) {
        self.init(red: (netHex >> 16) & 0xff, green: (netHex >> 8) & 0xff, blue: netHex & 0xff)
    }
}

@IBDesignable
class CustomTextField: UITextField {
    // MARK: - IBInspectable
    @IBInspectable var tintCol: UIColor = UIColor(netHex: 0x707070)
    @IBInspectable var fontCol: UIColor = UIColor(netHex: 0x707070)
    @IBInspectable var shadowCol: UIColor = UIColor(netHex: 0x707070)
    
    // MARK: - Properties
    var textFont = UIFont(name: "Helvetica Neue", size: 14.0)
    override func draw(_ rect: CGRect) {
        layer.masksToBounds = false
        backgroundColor = UIColor(red: 230, green: 230, blue: 230)
        layer.cornerRadius = 3.0
        tintColor = tintCol
        textColor = fontCol
        layer.borderWidth = 1
        layer.borderColor = UIColor(red: 255, green: 255, blue: 255).cgColor
        
        if let phText = placeholder {
            attributedPlaceholder = NSAttributedString(string: phText, attributes: [NSForegroundColorAttributeName: UIColor(netHex: 0xB3B3B3)])
        }
        
        if let fnt = textFont {
            font = fnt
        } else {
            font = UIFont(name: "Helvetica", size: 14.0)
        }
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 0)
    }
}
