//
//  DetailCurrencyPresenter.swift
//  CryptoInfoApp
//
//  Created by Александр Пархамович on 31.10.22.
//

import Foundation

protocol DetailCurrencyPresenterProtocol {
    func getModel()
}

final class DetailCurrencyPresenter: DetailCurrencyPresenterProtocol {

    // MARK: - Properties

    // MARK: Public
    unowned var view: DetailCurrencyViewProtocol
    private let router: DetailCurrencyRouterProtocol
    private let model: CurrencyModel

    // MARK: Private
    // MARK: - Lifecycle
    init(view: DetailCurrencyViewProtocol, router: DetailCurrencyRouterProtocol, model: CurrencyModel) {
        self.view = view
        self.router = router
        self.model = model
        getModel()
    }

    // MARK: - API
    func getModel() {
        view.setModel(model: model)
    }
    // MARK: - Setups
    // MARK: - Helpers
    // MARK: - Extensions
}
