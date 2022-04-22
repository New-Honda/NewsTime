//
//  NewsViewController.swift
//  NewsTime
//
//  Created by Oleksandr Sysenko on 19.04.2022.
//

import UIKit
import SafariServices

class NewsViewController: UIViewController {
    private var viewModel: NewsViewModelProtocol

    private let tableView = UITableView(frame: .zero, style: .insetGrouped)

    private let spinner = Spinner()

    private enum Section {
        case main
    }

    private lazy var dataSource = UITableViewDiffableDataSource<Section, ArticleModel>(
        tableView: tableView) { tableView, _, itemIdentifier -> UITableViewCell? in
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifire) as? NewsTableViewCell else { return nil }
        cell.setup(with: itemIdentifier)
        let callback: (ArticleModel) -> Void = { [weak self] article in
            self?.viewModel.favoriteButtonHandler(article: article)
        }
        cell.favoriteButtonActionCallback = callback
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setSubviews()
        setConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.loadNews()
    }

    init(with viewModel: NewsViewModelProtocol) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
        self.viewModel.newsViewDelegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setSubviews() {
        view.addSubview(tableView)
        setTableView()
    }

    private func setTableView() {
        tableView.delegate = self
        tableView.dataSource = dataSource
        tableView.separatorStyle = .none
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.identifire)
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    private func setConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    func errorAlert(message: String) {
        presentErrorAlert(message: message)
    }

    func startSpinner() {
        spinner.showSpinner(onView: view)
    }

    func stopSpinner() {
        spinner.removeSpinner()
    }
}

// MARK: - UITableViewDelegate

extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        130
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? NewsTableViewCell else { return }
        guard let urlPath = cell.acrticleUrlPath,
              let url = URL(string: urlPath) else { return }

        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true)
    }
}

// MARK: - NewsViewDelegate

extension NewsViewController: NewsViewDelegate {
    func updateDataSource(with articles: [ArticleModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, ArticleModel>()
        snapshot.appendSections([.main])
        snapshot.appendItems(articles, toSection: .main)
        dataSource.apply(snapshot)
    }
}
