import UIKit

class CryptoTableViewCell: UITableViewCell {

    @IBOutlet var cryptoNameLabel: UILabel!
    @IBOutlet var cryptoPriceLabel: UILabel!

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
