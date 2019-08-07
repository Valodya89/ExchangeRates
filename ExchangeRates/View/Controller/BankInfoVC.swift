//
//  BankInfoVC.swift
//  ExchangeRates
//
//  Created by Valodya Galstyan on 8/7/19.
//  Copyright © 2019 Valodya Galstyan. All rights reserved.
//

import UIKit

class BankInfoVC: BaseVC {

    @IBOutlet weak var activityView: UIActivityIndicatorView!
    @IBOutlet weak var bankNameLbl: UILabel!
    @IBOutlet weak var branchAddressLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var bankId = ""
    var bankName = ""
    var cashType = CashType.cashe
    var valutesList: [ValuteVM] = []
    var branchsList: [BranchVM] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bankNameLbl.text = self.bankName
        setupBranchList()
        self.activityView.isHidden = true
        self.activityView.stopAnimating()
        getBranchList()
    }
    
    func setupBranchList() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    func getBranchList() {
        
        self.activityView.isHidden = false
        self.activityView.startAnimating()
        BankNetwork.shared.getBankInfo(byId: self.bankId, complition: { branchList, error in
            
            if let err = error {
                print(err)
                self.activityView.isHidden = true
                self.activityView.stopAnimating()
                return
            }
            
            guard let list = branchList else { return }
            DispatchQueue.main.async {
                
                self.branchAddressLbl.text = list[0].branchAddress
                self.branchsList = list
                self.tableView.reloadData()
                self.activityView.isHidden = true
                self.activityView.stopAnimating()
            }
        })
    }
    
    @IBAction func chooseCashType(_ sender: UISegmentedControl) {

        switch sender.selectedSegmentIndex {
        case 0:
            self.cashType = .cashe
        case 1:
            self.cashType = .uncash
        default:
            break
        }
        self.tableView.reloadData()
    }
    
    @IBAction func backAction(_ sender: UIBarButtonItem) {
        
        self.navigationController?.popViewController(animated: true)
    }

}

extension BankInfoVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return valutesList.count
        case 1:
            return branchsList.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        switch indexPath.section {
        case 0:
            cell = (tableView.dequeueReusableCell(withIdentifier: "ValuteCell", for: indexPath) as? ValuteCell)!
            (cell as? ValuteCell)?.casheType = self.cashType
            (cell as? ValuteCell)?.item = self.valutesList[indexPath.row]
        case 1:
            cell = (tableView.dequeueReusableCell(withIdentifier: "BranchCell", for: indexPath) as? BranchCell)!
            (cell as? BranchCell)?.item = self.branchsList[indexPath.row]
        default:
            return cell
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 50.0))
        view.backgroundColor = .lightGray
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 50
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            
            self.branchAddressLbl.text = self.branchsList[indexPath.row].branchAddress
            self.tableView.setContentOffset(.zero, animated: true)
        }
    }
}
