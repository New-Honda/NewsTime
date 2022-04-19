//
//  TableViewCell.swift
//  NewsTime
//
//  Created by Oleksandr Sysenko on 19.04.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    static let identifire = "NewsTableViewCell"

    private enum Constants {
        static let cellCornerRadius: CGFloat = 12
        static let addToCartButtonCornerRadius: CGFloat = 15
        static let counterViewSpacing: CGFloat = 5
        static let cellShadowRadius: CGFloat = 24
        static let infoVerticalStackSpacing: CGFloat = 10
    }

    private let cellImageView: UIImageView = {
        let cellImageView = UIImageView(frame: .zero)
        cellImageView.contentMode = .scaleAspectFill
        cellImageView.clipsToBounds = true
        return cellImageView
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
