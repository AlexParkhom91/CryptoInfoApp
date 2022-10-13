//
//  CryptoInfoViewController.swift
//  CryptoInfoApp
//
//  Created by Александр Пархамович on 11.10.22.
//

import Foundation
import UIKit


final class CryptoInfoViewController: UIViewController {
    
    // MARK: - Crypto price & name label
    
    private let cryptoNameLabel = UILabel()
    private let cryptoPriceLabel = UILabel()
    
    
    // MARK: - UI Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getCryptoInfo()
        addCryptoNameLabel()
        addCryptoPriceLabel()
        
        view.backgroundColor = UIColor(named: "backgroundColor")
        
        
    }
    
    // MARK: - Get CryptoInfo From View Controller
    
    private func getCryptoInfo() {
        if let data = UserDefaults.standard.object(forKey: "cryptoInfo") as? Data,
           let getInfo = try? JSONDecoder().decode(CryptoModel.self, from: data) {
            
            cryptoNameLabel.text = "\(getInfo.name) (\(getInfo.id))"
            cryptoPriceLabel.text = "$ \(String(format: "%.3f", getInfo.price ?? 0))"
        }
    }
    
    // MARK: - CryptoNameLabel
    
    private  func addCryptoNameLabel() {
        view.addSubview(cryptoNameLabel)
        cryptoNameLabel.backgroundColor = UIColor(named: "cellColor")
        cryptoNameLabel.textColor = .systemGray
        cryptoNameLabel.font = UIFont.systemFont(ofSize: 32)
        cryptoNameLabel.translatesAutoresizingMaskIntoConstraints = false
        cryptoNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        cryptoNameLabel.heightAnchor.constraint(equalToConstant: 150).isActive = true
        cryptoNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        cryptoNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -25).isActive = true
       
    }
    
    // MARK: - CryptoPriceLabel
    
    private func addCryptoPriceLabel() {
        view.addSubview(cryptoPriceLabel)
        cryptoPriceLabel.backgroundColor = UIColor(named: "cellColor")
        cryptoPriceLabel.font = UIFont.systemFont(ofSize: 40)
        cryptoPriceLabel.textColor = .systemGray
        cryptoPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        cryptoPriceLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 250).isActive = true
        cryptoPriceLabel.heightAnchor.constraint(equalToConstant: 150).isActive = true
        cryptoPriceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        cryptoPriceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -25).isActive = true
       
       
    }
    
    
}
