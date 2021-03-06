//
//  UIImageView+Extension.swift
//  NewsTime
//
//  Created by Oleksandr Sysenko on 20.04.2022.
//

import UIKit
import Alamofire

extension UIImageView {
    private enum Constant {
        static let animationDuration: TimeInterval = 0.3
        static let animationOpacity: Float = 1
    }

    func loadImage(from url: URL?) -> DataRequest? {
        guard let url = url else { return nil }

        let request = AF.request(url)
        request.responseData { [weak self] response in
            guard let data = response.data else { return }
            DispatchQueue.main.async {
                self?.layer.opacity = .zero
                guard let image = UIImage(data: data) else { return }
                self?.image = image
                UIView.animate(withDuration: Constant.animationDuration) {
                    self?.layer.opacity = Constant.animationOpacity
                }
            }
        }
        return request
    }
}
