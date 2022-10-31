import Foundation

struct CurrencyModel: Codable {
    let name: String
    let price: Double?
    let id: String

    enum CodingKeys: String, CodingKey {
        case name
        case price = "price_usd"
        case id = "asset_id"
    }
}
