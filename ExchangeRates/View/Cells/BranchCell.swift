//
//  BranchCell.swift
//  ExchangeRates
//
//  Created by Valodya Galstyan on 8/7/19.
//  Copyright © 2019 Valodya Galstyan. All rights reserved.
//

import UIKit

class BranchCell: UITableViewCell {

    
    @IBOutlet weak var branchName: UILabel!
    @IBOutlet weak var branchAddress: UILabel!
    
    var item: BranchVM = BranchVM() {
        didSet {
            self.branchName.text = item.branchName
            self.branchAddress.text = item.branchAddress
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
