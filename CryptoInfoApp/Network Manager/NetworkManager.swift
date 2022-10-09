//
//  NetworkManager.swift
//  CryptoInfoApp
//
//  Created by Александр Пархамович on 9.10.22.
//
//API Key: 35EEB132-B8F5-41C7-A693-E767FD2AFECD
import Foundation

final class NetworkManager {
    
    enum Constants {
        static let urlString = "https://rest.coinapi.io/v1/assets?apikey="
    }
    enum ApiKey {
        static let key = "35EEB132-B8F5-41C7-A693-E767FD2AFECD"
    }
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func getCryptoInfo(completion: @escaping(Result<[CryptoModel],Error>)-> Void) {
        guard let url = URL(string: Constants.urlString + ApiKey.key) else { return }
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            DispatchQueue.main.async {
            if let error = error {
                print(error.localizedDescription)
            }
            guard let data = data else { return }
            do {
                let jsonData = try JSONDecoder().decode([CryptoModel].self, from: data)
                completion(.success(jsonData))
            } catch {
                completion(.failure(error))
            }
        }
        }.resume()
    }
}
