//
//  BankCell.swift
//  ExchangeRates
//
//  Created by Valodya Galstyan on 8/7/19.
//  Copyright © 2019 Valodya Galstyan. All rights reserved.
//

import UIKit

class BankCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var salesLbl: UILabel!
    @IBOutlet weak var buyLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var distanceLbl: UILabel!
    
    var cashType = CashType.cashe
    var item: BankVM = BankVM() {
        didSet {
            self.titleLbl.text = item.bankName
            
            switch cashType {
            case .cashe:
                self.buyLbl.text = "\(item.cashBuy)"
                self.salesLbl.text = "\(item.cashSell)"
            case .uncash:
                self.buyLbl.text = "\(item.unCashBuy)"
                self.salesLbl.text = "\(item.unCashSell)"
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
