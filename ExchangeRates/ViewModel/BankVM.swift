//
//  BankVM.swift
//  ExchangeRatesAssignment
//
//  Created by Valodya Galstyan on 8/7/19.
//  Copyright © 2019 Valodya Galstyan. All rights reserved.
//

import UIKit

class BankVM: BaseViewModel {
    
    var bankId = ""
    var bankName = ""
    var purchase = ""
    var salesman = ""
    var logo = ""
    var date = 0.0
    var cashBuy = 0.0
    var cashSell = 0.0
    var unCashBuy = 0.0
    var unCashSell = 0.0
    var bankValuetsList: [ValuteVM]?

    func initWithModel(byValuteName: String, bankId: String, bankValuetsList: [ValuteVM], model: BankModel) -> BaseViewModel {
        
        self.bankId = bankId
        self.bankName = model.title
        self.logo = model.logo
        self.date = model.date
        self.bankValuetsList = bankValuetsList
        
        if let value = model.list![byValuteName] {
            for (key,val) in value {
                if key == "0" {
                    self.cashBuy = val.buy
                    self.cashSell = val.sell
                }
                if key == "1" {
                    self.unCashBuy = val.buy
                    self.unCashSell = val.sell
                }
            }
        }
        return self
    }
    
}
