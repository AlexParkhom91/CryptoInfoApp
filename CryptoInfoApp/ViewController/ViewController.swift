//
//  ViewController.swift
//  CryptoInfoApp
//
//  Created by Александр Пархамович on 9.10.22.
//

import UIKit

final class ViewController: UIViewController {

    // MARK: - Crypto TableView
    
    @IBOutlet weak var cryptoTableView: UITableView!
    
    // MARK: - Varibles
    
   private var cryptoArray = [CryptoModel]()
    
    //MARK: - UI Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        getCryptoInfo()
        setupCurrencyTable()
        
    }
    //MARK: - Get CryptoInfo From Api
    
    private func getCryptoInfo() {
        NetworkManager.shared.getCryptoInfo { [weak self] (result) in
            switch result {
            case .success(let cryptoData):
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
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoTableViewCell", for: indexPath) as? CryptoTableViewCell else { return UITableViewCell()}
        
        cell.settingLayerCell(cell: cell)
        
        let priceCrypto =  String(format: "%.3f", cryptoArray[indexPath.row].price ?? 0)
        let nameCrypto = cryptoArray[indexPath.row].name
        
        cell.setLabels(nameLabel: nameCrypto, priceLabel: "$ \(priceCrypto)")
        
        return cell
    }
}
// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
