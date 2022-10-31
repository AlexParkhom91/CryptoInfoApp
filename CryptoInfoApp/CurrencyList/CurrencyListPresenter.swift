//
//  CurrencyListPresenter.swift
//  CryptoInfoApp
//
//  Created by Александр Пархамович on 31.10.22.
//

import Foundation

protocol CurrencyListPresenterProtocol {
    func getCurrency()
    func moveToDetailView(with model: CurrencyModel)
}

final class CurrencyListPresenter: CurrencyListPresenterProtocol {

    // MARK: - Properties

    // MARK: Public
    unowned var view: CurrencyListViewProtocol
    private let router: CyrrencyListRouterPriotocol

    // MARK: Private
    // MARK: - Lifecycle
    init(view: CurrencyListViewProtocol, router: CyrrencyListRouterPriotocol) {
        self.view = view
        self.router = router
        getCurrency()
    }

    // MARK: - API
    func getCurrency() {
        let urlString = "https://rest.coinapi.io/v1/assets?apikey=35EEB132-B8F5-41C7-A693-E767FD2AFECD"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
            }
            guard let data = data else { return }
            do {
                let jsonData = try JSONDecoder().decode([CurrencyModel].self, from: data)
                self.view.updateTable(with: jsonData)
            } catch {
                print("We have error in block catch: \(error.localizedDescription)")
            }

        }.resume()
    }

    func moveToDetailView(with model: CurrencyModel) {
        router.moveToDetailScreen(with: model)
    }
    // MARK: - Setups
    // MARK: - Helpers
}
