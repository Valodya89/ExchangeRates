//
//  RateViewController.swift
//  ExchangeRatesAssignment
//
//  Created by Valodya Galstyan on 8/7/19.
//  Copyright © 2019 Valodya Galstyan. All rights reserved.
//

import UIKit

class RateViewController: BaseVC {

    
    @IBOutlet weak var valuteNameLbl: UILabel!
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    @IBOutlet weak var cashSelectedIcon: VGImageView!
    @IBOutlet weak var uncashSelectedIcon: VGImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var tableData: [BankVM] = []
    var valuteType = ValuteType.USD
    var cashType = CashType.cashe
    var pickerVC = ValutePickerVC()
    var pickerViewHeight: CGFloat = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.isHidden = true
        self.setupPickerView()
        self.getBankList()
    }
    
    func setupBankList() {
        
        activityView.isHidden = true
        activityView.stopAnimating()
        tableView.isHidden = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }

    @IBAction func changeValuteAction(_ sender: UIButton) {
        
        self.showPicker()
    }
    
    
    @IBAction func chooseCachtypeAction(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            self.cashType = .cashe
            self.cashSelectedIcon.isHidden = false
            self.uncashSelectedIcon.isHidden = true
        case 1:
            self.cashType = .uncash
            self.cashSelectedIcon.isHidden = true
            self.uncashSelectedIcon.isHidden = false
        default:
            break
        }
        self.tableView.reloadData()
    }
    
    func getBankList() {
        
        activityView.isHidden = false
        activityView.startAnimating()
        
        BankNetwork.shared.getBanksList(valuteName: valuteType.rawValue) { (bankList, error) in
            
            if let err = error {
                print(err.localizedDescription)
                return
            }
            
            if let data = bankList {
                DispatchQueue.main.async {
                    self.tableData = data
                    self.setupBankList()
                }
            }
        }
    }
    
    func setupPickerView() {
        
        self.pickerViewHeight = self.view.frame.height / 2.5

        pickerVC = (self.storyboard?.instantiateViewController(withIdentifier: "ValutePickerVC") as? ValutePickerVC)!
        pickerVC.view.frame = CGRect(x: 0, y: self.view.frame.height, width: self.view.bounds.width, height: pickerViewHeight)
        pickerVC.view.backgroundColor = .clear
        pickerVC.handleDidSelectDone = { selectedValute in
            
            self.valuteType = selectedValute
            self.valuteNameLbl.text = selectedValute.rawValue
            self.getBankList()
            self.hidePicker()
        }
        
        self.addChild(pickerVC)
        self.view.addSubview(pickerVC.view)
        self.didMove(toParent: pickerVC)
    }
    
    func showPicker() {
        
        UIView.animate(withDuration: 0.3) {
            self.pickerVC.view.frame = CGRect(x: 0, y: self.view.frame.height - self.pickerViewHeight, width: self.view.bounds.width, height: self.pickerViewHeight)
            self.view.layoutIfNeeded()
        }
    }
    
    func hidePicker() {
        
        UIView.animate(withDuration: 0.3) {
            self.pickerVC.view.frame = CGRect(x: 0, y: self.view.frame.height, width: self.view.bounds.width, height: self.pickerViewHeight)
            self.view.layoutIfNeeded()
        }
    }
    
    func goToBankInfo(bankId: String, name: String, valutesList: [ValuteVM]) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "BankInfoVC") as? BankInfoVC
        vc?.bankId = bankId
        vc?.valutesList = valutesList
        vc?.bankName = name
        vc?.view.backgroundColor = .white
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

extension RateViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BankCell", for: indexPath) as? BankCell
        
        cell?.item = self.tableData[indexPath.row]
        cell?.cashType = self.cashType
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.goToBankInfo(bankId: self.tableData[indexPath.row].bankId, name: self.tableData[indexPath.row].bankName, valutesList: self.tableData[indexPath.row].bankValuetsList!)
    }
}

