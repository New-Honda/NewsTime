//
//  NewsDetailsViewController.swift
//  NewsTime
//
//  Created by Oleksandr Sysenko on 20.04.2022.
//

import UIKit
import WebKit

class NewsDetailsViewController: UIViewController {
    private var viewModel: NewsDetailsViewModelProtocol

    private let webView = WKWebView()

    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        setConstraints()
        viewModel.loadPage()
    }

    init(with viewModel: NewsDetailsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.viewDelegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addSubviews() {
        view.addSubview(webView)
    }

    private func setConstraints() {
        webView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
}

extension NewsDetailsViewController: NewsDetailsViewDelegate {
    func loadData(request: URLRequest) {
        webView.load(request)
    }
}
