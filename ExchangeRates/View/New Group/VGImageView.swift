//
//  VGImageView.swift
//  ExchangeRatesAssignment
//
//  Created by Valodya Galstyan on 8/7/19.
//  Copyright © 2019 Valodya Galstyan. All rights reserved.
//

import UIKit

@IBDesignable
class VGImageView: UIImageView {

    @IBInspectable var CornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = CornerRadius
        }
    }
    
    @IBInspectable var BorderColor: UIColor = .lightGray {
        didSet {
            self.layer.borderColor = BorderColor.cgColor
        }
    }
    
    @IBInspectable var BorderWigth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = BorderWigth
        }
    }
    
}
