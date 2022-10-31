//
//  CurrencyListTableViewCell.swift
//  CryptoInfoApp
//
//  Created by Александр Пархамович on 31.10.22.
//

import UIKit

final class CurrencyListTableViewCell: UITableViewCell {

    // MARK: - Properties
    let nameCurrencyLabel = UILabel()
    let priceCurrencyLabel = UILabel()
    // MARK: Public

    // MARK: Private

    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "CurrencyListTableViewCell")
        setupSubviews()
        setupConstraints()
        configureUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - API

    // MARK: - Setups

    private func setupSubviews() {
        [nameCurrencyLabel, priceCurrencyLabel].forEach { contentView.addSubview($0) }
    }

    private func setupConstraints() {
        [nameCurrencyLabel, priceCurrencyLabel].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        NSLayoutConstraint.activate([
            nameCurrencyLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameCurrencyLabel.widthAnchor.constraint(equalToConstant: 180),
            nameCurrencyLabel.heightAnchor.constraint(equalToConstant: 40),
            nameCurrencyLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),

            priceCurrencyLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            priceCurrencyLabel.widthAnchor.constraint(equalToConstant: 120),
            priceCurrencyLabel.heightAnchor.constraint(equalToConstant: 40),
            priceCurrencyLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }

    private func configureUI() {
        contentView.backgroundColor = UIColor(named: "cellColor")

        nameCurrencyLabel.font = UIFont.systemFont(ofSize: 20)
        nameCurrencyLabel.textColor = .white

        priceCurrencyLabel.font = UIFont.systemFont(ofSize: 20)
        priceCurrencyLabel.textAlignment = .right
        priceCurrencyLabel.textColor = .white
    }
    // MARK: - Helpers
}
