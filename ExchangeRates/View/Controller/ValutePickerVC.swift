//
//  ValutePickerVC.swift
//  ExchangeRates
//
//  Created by Valodya Galstyan on 8/7/19.
//  Copyright © 2019 Valodya Galstyan. All rights reserved.
//

import UIKit

class ValutePickerVC: UIViewController {

    
    @IBOutlet weak var dataPicker: UIPickerView!

    var handleDidSelectDone: ((ValuteType) -> Void)?
    var selectedPickerValue = ""
    var selectedValuteType: ValuteType?
    var pickerData: [String] = ["USD","EUR","RUR","GBP","CHF","CAD","AUD","JPY","XAU"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.dataPicker.delegate = self
        self.dataPicker.dataSource = self
    }
    
    @IBAction func doneAction(_ sender: UIButton) {
        
        switch self.selectedPickerValue {
        case "USD":
            self.selectedValuteType = .USD
        case "EUR":
            self.selectedValuteType = .EUR
        case "RUR":
            self.selectedValuteType = .RUR
        case "GBP":
            self.selectedValuteType = .GBP
        case "CHF":
            self.selectedValuteType = .CHF
        case "CAD":
            self.selectedValuteType = .CAD
        case "AUD":
            self.selectedValuteType = .AUD
        case "JPY":
            self.selectedValuteType = .JPY
        case "XAU":
            self.selectedValuteType = .XAU
        default:
            self.selectedValuteType = .USD
        }
        self.handleDidSelectDone!(self.selectedValuteType!)
    }

}

extension ValutePickerVC: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.selectedPickerValue = pickerData[row]
        print(pickerData[row])
    }
}
