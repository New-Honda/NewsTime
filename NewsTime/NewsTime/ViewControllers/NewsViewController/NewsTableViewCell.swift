//
//  NewsTableViewCell.swift
//  NewsTime
//
//  Created by Oleksandr Sysenko on 19.04.2022.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    static let identifire = "NewsTableViewCell"

    private enum Constants {
        static let stackViewSpacing: CGFloat = 5
        static let favoriteButtonImageName = "star.fill"
    }

    private var article: Article? {
        didSet {
            guard let article = article else { return }
            titleLabel.text = article.title
            descriptionLabel.text = article.abstract
            creationDataLabel.text = article.publishedDate
            byLineLabel.text = article.byLine

            cellImageView.image = UIImage(named: "Logo")
        }
    }

    private let cellImageView: UIImageView = {
        let cellImageView = UIImageView(frame: .zero)
        cellImageView.contentMode = .scaleAspectFill
        cellImageView.clipsToBounds = true
        return cellImageView
    }()

    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 15)
        titleLabel.numberOfLines = 4
        return titleLabel
    }()

    private let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.font = .systemFont(ofSize: 10)
        descriptionLabel.numberOfLines = 3
        return descriptionLabel
    }()

    private let favoriteButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: Constants.favoriteButtonImageName)
        button.setBackgroundImage(image, for: .normal)
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

    func setup(with model: Article) {
        article = model
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addSubviews()
        setConstraints()
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
            titleStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            infoStack.topAnchor.constraint(equalTo: titleStack.bottomAnchor, constant: 10),
            infoStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            infoStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),

            favoriteButton.widthAnchor.constraint(equalToConstant: 25),
            favoriteButton.heightAnchor.constraint(equalToConstant: 25),
            favoriteButton.topAnchor.constraint(equalTo: titleStack.bottomAnchor, constant: 10),
            favoriteButton.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 10),
            favoriteButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
}
