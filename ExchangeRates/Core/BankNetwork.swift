//
//  BankNetwork.swift
//  ExchangeRatesAssignment
//
//  Created by Valodya Galstyan on 8/7/19.
//  Copyright © 2019 Valodya Galstyan. All rights reserved.
//

import UIKit

class BankNetwork: NSObject {

    static let shared = BankNetwork()
    private var bankList: [BankVM] = []
    var decoder = JSONDecoder()

    func getBanksList(valuteName: String, complition: @escaping ([BankVM]?,Error?) -> Void) {
        
        NetworkManager.shared.getRequest(urlString: "rates.ashx?lang=en") { (data, error) in
            
            if let err = error {
               complition(nil, err)
                return
            }
            self.bankList = []
            
            do {
                let value = try self.decoder.decode([String:BankModel].self, from: data as! Data)
               let bankList: [String:BankModel] = value
                    if bankList.count > 0 {
                        for (bankId, bankData) in bankList {
                            if bankData.list![valuteName] != nil {
                                var bankVM = BankVM()
                                bankVM = bankVM.initWithModel(byValuteName: valuteName, bankId: bankId, bankValuetsList: self.getBankValutesList(bankData: bankData), model: bankData) as! BankVM
                                self.bankList.append(bankVM)
                            }
                        }
                    }
                complition(self.bankList,nil)
            } catch {
                complition(nil,error)
            }
        }
    }
    
    func getBankValutesList(bankData: BankModel) -> [ValuteVM] {
        
        var valuteList: [ValuteVM] = []
        for (name,value) in bankData.list! {
            var valuteVM = ValuteVM()
            valuteVM = valuteVM.initWithModel(valuteName: name, model: value) as! ValuteVM
            valuteList.append(valuteVM)
        }
        return valuteList
    }
    
    func getBankInfo(byId: String, complition: @escaping ([BranchVM]?,Error?) -> Void) {
        
        NetworkManager.shared.getRequest(urlString: "branches.ashx?id="+byId) { (data, error) in
            
            if let err  = error {
                complition(nil, err)
                return
            }
            
            do {
                let value = try self.decoder.decode(BankDetailsModel.self, from: data as! Data)

                guard let branchList: [String : BranchModel] = value.list else { return }
                
                var branchesList: [BranchVM] = []
                
                for branch in branchList.values {
                    var branchVM = BranchVM()
                    branchVM = branchVM.initWithModel(model: branch) as! BranchVM
                    branchesList.append(branchVM)
                }
                
                complition(branchesList, nil)
            } catch {
                complition(nil,error)
            }  
        }
    }
}
