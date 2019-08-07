//
//  ValuteVM.swift
//  ExchangeRates
//
//  Created by Valodya Galstyan on 8/7/19.
//  Copyright © 2019 Valodya Galstyan. All rights reserved.
//

import UIKit

class ValuteVM: BaseViewModel {

    var valuteName = ""
    var cashBuy = 0.0
    var cashSell = 0.0
    var unCashBuy = 0.0
    var unCashSell = 0.0
    
    func initWithModel(valuteName: String,  model: [String: Valute]) -> BaseViewModel {
        
        self.valuteName = valuteName
        for (key,val) in model {
            if key == "0" {
                self.cashBuy = val.buy
                self.cashSell = val.sell
            }
            if key == "1" {
                self.unCashBuy = val.buy
                self.unCashSell = val.sell
            }
        }
        return self
    }
}
