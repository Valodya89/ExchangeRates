//
//  BranchVM.swift
//  ExchangeRates
//
//  Created by Valodya Galstyan on 8/7/19.
//  Copyright © 2019 Valodya Galstyan. All rights reserved.
//

import UIKit

class BranchVM: BaseViewModel {

    var branchName = ""
    var branchAddress = ""
    
    func initWithModel( model: BranchModel) -> BaseViewModel {
        
        if let name = model.title!["en"] {
            self.branchName = name
        } else if let name = model.title!["am"] {
            self.branchName = name
        }
        
        if let name = model.address!["en"] {
            self.branchAddress = name
        } else if let name = model.address!["am"] {
            self.branchAddress = name
        }
        return self
    }
    
}
