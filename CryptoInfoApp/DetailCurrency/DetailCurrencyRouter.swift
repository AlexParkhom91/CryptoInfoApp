//
//  DetailCurrencyRouter.swift
//  CryptoInfoApp
//
//  Created by Александр Пархамович on 31.10.22.
//

import UIKit

protocol DetailCurrencyRouterProtocol {}

final class DetailCurrencyRouter {
    // MARK: - Properties
    // MARK: Public
    // MARK: Private
    private let navigationController: UINavigationController
    private let currentCurrencyModel: CurrencyModel

    // MARK: - Lifecycle
    init(navigationController: UINavigationController, model: CurrencyModel) {
        self.navigationController = navigationController
        self.currentCurrencyModel = model
        let view = DetailCurrencyViewController()
        let presenter = DetailCurrencyPresenter(view: view, router: self, model: model)
        view.presenter = presenter
        navigationController.pushViewController(view, animated: true)
    }
    // MARK: - API
    // MARK: - Setups
    // MARK: - Helpers
    // MARK: - Extensions
}

extension DetailCurrencyRouter: DetailCurrencyRouterProtocol {
    
}

