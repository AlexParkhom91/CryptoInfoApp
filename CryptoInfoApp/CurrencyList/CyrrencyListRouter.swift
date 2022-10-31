//
//  CyrrencyListRouter.swift
//  CryptoInfoApp
//
//  Created by Александр Пархамович on 31.10.22.
//

import Foundation
import UIKit

protocol CyrrencyListRouterPriotocol {
    func moveToDetailScreen(with model: CurrencyModel)
}

final class CyrrencyListRouter {
    // MARK: - Properties
    // MARK: Public

    // MARK: Private

    private let navigationController: UINavigationController

    // MARK: - Lifecycle
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        let view = CurrencyListViewController()
        let presenter = CurrencyListPresenter(view: view, router: self)
        view.presenter = presenter
        navigationController.pushViewController(view, animated: true)
    }
    // MARK: - API
    // MARK: - Setups
    // MARK: - Helpers
}

extension CyrrencyListRouter: CyrrencyListRouterPriotocol {
    func moveToDetailScreen(with model: CurrencyModel) {
        _ = DetailCurrencyRouter(navigationController: navigationController, model: model)
    }
}

