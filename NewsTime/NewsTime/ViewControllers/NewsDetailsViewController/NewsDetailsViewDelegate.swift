//
//  NewsDetailsViewDelegate.swift
//  NewsTime
//
//  Created by Oleksandr Sysenko on 20.04.2022.
//

import Foundation

protocol NewsDetailsViewDelegate: AnyObject {
    func loadData(request: URLRequest)
}
