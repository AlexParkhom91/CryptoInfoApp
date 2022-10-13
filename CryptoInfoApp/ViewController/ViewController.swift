import UIKit

final class ViewController: UIViewController {

    // MARK: - Crypto TableView

    let indicator = UIActivityIndicatorView()

    @IBOutlet var cryptoTableView: UITableView!

    // MARK: - Varibles

    private var cryptoArray = [CryptoModel]()

    // MARK: - UI Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        indicatorLoad()
        getCryptoInfo()
        setupCurrencyTable()
    }

    // MARK: - Activity load indicator

    private func indicatorLoad() {

        indicator.color = UIColor.cyan
        indicator.frame = CGRectMake(0.0, 0.0, 10.0, 10.0)
        indicator.center = view.center
        view.addSubview(indicator)
        indicator.bringSubviewToFront(view)
        indicator.startAnimating()
    }

    // MARK: - Get CryptoInfo From Api

    private func getCryptoInfo() {
        NetworkManager.shared.getCryptoInfo { [weak self] result in
            switch result {
            case .success(let cryptoData):

                self?.indicator.stopAnimating()
                self?.indicator.hidesWhenStopped = true

                self?.cryptoArray = cryptoData

                self?.cryptoTableView.reloadData()

            case .failure(let error): print(error.localizedDescription)
            }
        }
    }

    // MARK: - Setup Cypto Table

    private func setupCurrencyTable() {
        cryptoTableView.delegate = self
        cryptoTableView.dataSource = self

        cryptoTableView.rowHeight = 80

        cryptoTableView.backgroundColor = UIColor(named: "backgroundColor")
        cryptoTableView.register(UINib(nibName: "CryptoTableViewCell", bundle: nil), forCellReuseIdentifier: "CryptoTableViewCell")
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cryptoArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoTableViewCell", for: indexPath) as? CryptoTableViewCell else { return UITableViewCell() }

        cell.settingLayerCell(cell: cell)

        let priceCrypto = String(format: "%.3f", cryptoArray[indexPath.row].price ?? 0)
        let nameCrypto = cryptoArray[indexPath.row].name

        cell.setLabels(nameLabel: nameCrypto, priceLabel: "$ \(priceCrypto)")

        return cell
    }
}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let infoSelectRow = cryptoArray[indexPath.row]

        // MARK: - CryptoInfoViewController

        if let encoded = try? JSONEncoder().encode(infoSelectRow) {
            UserDefaults.standard.set(encoded, forKey: "cryptoInfo")

            let cryptoInfoViewController = CryptoInfoViewController()
            navigationController?.pushViewController(cryptoInfoViewController, animated: true)
        }
    }
}
