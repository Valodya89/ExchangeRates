//
//  BankModel.swift
//  ExchangeRatesAssignment
//
//  Created by Valodya Galstyan on 8/7/19.
//  Copyright © 2019 Valodya Galstyan. All rights reserved.
//

import UIKit

struct BankModel: Codable {
    
    var title = ""
    var date = 0.0
    var logo = ""
    var list: [String: [String: Valute]]?
}

struct Valute: Codable {
    
    var buy = 0.0
    var sell = 0.0
}
