//
//  CryptoTableViewCell.swift
//  CryptoInfoApp
//
//  Created by Александр Пархамович on 9.10.22.
//

import UIKit

class CryptoTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var cryptoNameLabel: UILabel!
    @IBOutlet weak var cryptoPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cryptoNameLabel.font = UIFont.systemFont(ofSize: 20)
        cryptoPriceLabel.font = UIFont.systemFont(ofSize: 20)
    }
    func setLabels(nameLabel: String, priceLabel: String) {
        
        cryptoNameLabel.text = nameLabel
        cryptoPriceLabel.text = priceLabel
    }
    
    func settingLayerCell(cell: UITableViewCell) {
          cell.layer.cornerRadius = 15
          cell.layer.borderWidth = 10
    }
}

