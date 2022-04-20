//
//  NewsViewController.swift
//  NewsTime
//
//  Created by Oleksandr Sysenko on 19.04.2022.
//

import UIKit

class NewsViewController: UIViewController {
    private var viewModel: NewsViewModelProtocol

    private let tableView = UITableView(frame: .zero, style: .insetGrouped)

    private enum Section {
        case main
    }

    private lazy var dataSource = UITableViewDiffableDataSource<Section, Article>(tableView: tableView) { tableView, indexPath, itemIdentifier -> UITableViewCell? in
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifire) as? NewsTableViewCell else { return nil }
        cell.setup(with: itemIdentifier)
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setSubviews()
        setConstraints()
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
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 150
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
}

extension NewsViewController: UITableViewDelegate { }

extension NewsViewController: NewsViewDelegate {
    func updateDataSource(with articles: [Article]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Article>()
        snapshot.appendSections([.main])
        snapshot.appendItems(articles, toSection: .main)
        dataSource.apply(snapshot)
    }
}
