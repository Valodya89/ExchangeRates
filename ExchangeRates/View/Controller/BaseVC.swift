//
//  BaseVC.swift
//  ExchangeRates
//
//  Created by Valodya Galstyan on 8/7/19.
//  Copyright © 2019 Valodya Galstyan. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

enum ValuteType: String {
    
    case USD
    case EUR
    case RUR
    case GBP
    case CHF
    case CAD
    case AUD
    case JPY
    case XAU
}

enum CashType {
    
    case cashe
    case uncash
}
