//
//  CryptoModel.swift
//  CryptoInfoApp
//
//  Created by Александр Пархамович on 9.10.22.
//

import Foundation

struct CryptoModel: Codable {
    let name: String
    let price: Double?
    let id: String
    
    enum CodingKeys: String,CodingKey {
        case name
        case price = "price_usd"
        case id = "asset_id"
    }
}

