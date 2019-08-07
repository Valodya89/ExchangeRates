//
//  BankDetailsModel.swift
//  ExchangeRates
//
//  Created by Valodya Galstyan on 8/7/19.
//  Copyright © 2019 Valodya Galstyan. All rights reserved.
//

import UIKit

struct BankDetailsModel: Codable {
    
    var date = 0.0
    var list: [String: BranchModel]?
}

struct BranchModel: Codable {
    
    var head = 0
    var title: [String : String]?
    var address: [String : String]?
    var location: [String : Double]?
    var contacts = ""
    var workhours: [Workhours]

}

struct Workhours: Codable {
    
    var days = ""
    var hours = ""
}
