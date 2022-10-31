import UIKit

protocol DetailCurrencyViewProtocol: AnyObject {
    func setModel(model: CurrencyModel)
}

final class DetailCurrencyViewController: UIViewController {
    // MARK: - Properties

    // MARK: Public
    var presenter: DetailCurrencyPresenterProtocol!

    // MARK: Private
    private let currentCurrencyNameLabel = UILabel()
    private let currentCurrencyPricaLabel = UILabel()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
        configureUI()
    }

    // MARK: - API

    // MARK: - Setups
    private func setupSubviews() {
        [currentCurrencyNameLabel, currentCurrencyPricaLabel].forEach { view.addSubview($0) }
    }

    private func setupConstraints() {
        [currentCurrencyNameLabel, currentCurrencyPricaLabel].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        NSLayoutConstraint.activate([
            currentCurrencyNameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            currentCurrencyNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            currentCurrencyNameLabel.heightAnchor.constraint(equalToConstant: 40),
            currentCurrencyNameLabel.widthAnchor.constraint(equalToConstant: 200),

            currentCurrencyPricaLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 80),
            currentCurrencyPricaLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            currentCurrencyPricaLabel.widthAnchor.constraint(equalToConstant: 200),
            currentCurrencyPricaLabel.heightAnchor.constraint(equalToConstant: 40)

        ])
    }

    private func configureUI() {
        view.backgroundColor = UIColor(named: "backgroundColor")
        [currentCurrencyNameLabel, currentCurrencyPricaLabel].forEach { $0.textAlignment = .center }
        [currentCurrencyNameLabel, currentCurrencyPricaLabel].forEach { $0.textColor = .white }
        [currentCurrencyNameLabel, currentCurrencyPricaLabel].forEach { $0.font = UIFont.systemFont(ofSize: 22) }
    }
}

// MARK: - Helpers

// MARK: - Extensions
extension DetailCurrencyViewController: DetailCurrencyViewProtocol {
    func setModel(model: CurrencyModel) {
        currentCurrencyNameLabel.text = model.name
        currentCurrencyPricaLabel.text = "\(String(format: "%.3f", model.price ?? 0))"
        print(model.name)
    }
}
