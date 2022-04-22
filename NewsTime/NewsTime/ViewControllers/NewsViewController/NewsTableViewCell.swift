//
//  NewsTableViewCell.swift
//  NewsTime
//
//  Created by Oleksandr Sysenko on 19.04.2022.
//

import UIKit
import Alamofire

class NewsTableViewCell: UITableViewCell {
    static let identifire = "NewsTableViewCell"

    private enum Constants {
        static let stackViewSpacing: CGFloat = 5
        static let favoriteButtonImageName = "star.fill"
    }

    private var article: ArticleModel? {
        didSet {
            guard let article = article else { return }
            titleLabel.text = article.title
            descriptionLabel.text = article.abstract
            creationDataLabel.text = article.publishedDate
            byLineLabel.text = article.byLine

            guard let mediaUrlString = article.media.last?.medias.last?.url else {
                cellImageView.image = UIImage(named: "NoImage")
                return
            }
            let url = URL(string: mediaUrlString)
            mediaRequest = cellImageView.loadImage(from: url)
        }
    }

    var acrticleUrlPath: String? {
        article?.url
    }

    private var mediaRequest: DataRequest?

    private let cellImageView: UIImageView = {
        let cellImageView = UIImageView(frame: .zero)
        cellImageView.contentMode = .scaleAspectFit
        cellImageView.clipsToBounds = true
        return cellImageView
    }()

    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 15)
        titleLabel.numberOfLines = 3
        return titleLabel
    }()

    private let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.font = .systemFont(ofSize: 10)
        descriptionLabel.numberOfLines = 2
        return descriptionLabel
    }()

    private let favoriteButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: Constants.favoriteButtonImageName)
        button.setImage(image, for: .normal)
        return button
    }()

    private let byLineLabel: UILabel = {
        let byLineLabel = UILabel()
        byLineLabel.font = .systemFont(ofSize: 8)
        return byLineLabel
    }()

    private let creationDataLabel: UILabel = {
        let creationDataLabel = UILabel()
        creationDataLabel.font = .systemFont(ofSize: 8)
        return creationDataLabel
    }()

    private let titleStack: UIStackView = {
        let titleStack = UIStackView()
        titleStack.axis  = .vertical
        titleStack.distribution  = .equalCentering
        titleStack.alignment = .leading
        titleStack.spacing = Constants.stackViewSpacing
        return titleStack
    }()

    private let infoStack: UIStackView = {
        let infoStack = UIStackView()
        infoStack.axis  = .vertical
        infoStack.distribution  = .equalCentering
        infoStack.alignment = .trailing
        infoStack.spacing = Constants.stackViewSpacing
        return infoStack
    }()

    var favoriteButtonActionCallback: (ArticleModel) -> Void = { _ in }

    func setup(with model: ArticleModel) {
        article = model
    }

    @objc
    private func favoriteButtonAction() {
        guard let article = article else { return }
        favoriteButtonActionCallback(article)
    }

    private func setButtonsAction() {
        favoriteButton.addTarget(self, action: #selector(favoriteButtonAction), for: .touchUpInside)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        mediaRequest?.cancel()
        cellImageView.image = nil
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addSubviews()
        setConstraints()
        setButtonsAction()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addSubviews() {
        contentView.addSubview(cellImageView)
        cellImageView.translatesAutoresizingMaskIntoConstraints = false

        titleStack.addArrangedSubview(titleLabel)
        titleStack.addArrangedSubview(descriptionLabel)
        contentView.addSubview(titleStack)
        titleStack.translatesAutoresizingMaskIntoConstraints = false

        infoStack.addArrangedSubview(creationDataLabel)
        infoStack.addArrangedSubview(byLineLabel)
        contentView.addSubview(infoStack)
        infoStack.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(favoriteButton)
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            cellImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cellImageView.widthAnchor.constraint(equalToConstant: contentView.frame.width * 0.3),

            titleStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleStack.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 10),
            titleStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),

            infoStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            infoStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            infoStack.leadingAnchor.constraint(equalTo: favoriteButton.trailingAnchor),

            favoriteButton.widthAnchor.constraint(equalToConstant: 25),
            favoriteButton.heightAnchor.constraint(equalToConstant: 25),
            favoriteButton.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 10),
            favoriteButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
}
