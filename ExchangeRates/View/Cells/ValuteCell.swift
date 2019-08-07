//
//  ValuteCell.swift
//  ExchangeRates
//
//  Created by Valodya Galstyan on 8/7/19.
//  Copyright © 2019 Valodya Galstyan. All rights reserved.
//

import UIKit

class ValuteCell: UITableViewCell {

    @IBOutlet weak var valuteNameLbl: UILabel!
    @IBOutlet weak var sellLbl: UILabel!
    @IBOutlet weak var buyLbl: UILabel!
    
    var casheType = CashType.cashe
    
    var item: ValuteVM = ValuteVM() {
        didSet {
            self.valuteNameLbl.text = "\(item.valuteName)"
            switch self.casheType {
            case .cashe:
                self.buyLbl.text = "\(item.cashBuy)"
                self.sellLbl.text = "\(item.cashSell)"
            case .uncash:
                self.buyLbl.text = "\(item.unCashBuy)"
                self.sellLbl.text = "\(item.unCashSell)"
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
