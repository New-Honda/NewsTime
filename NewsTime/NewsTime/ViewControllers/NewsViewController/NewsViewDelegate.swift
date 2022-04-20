//
//  NewsViewDelegate.swift
//  NewsTime
//
//  Created by Oleksandr Sysenko on 20.04.2022.
//

protocol NewsViewDelegate: AnyObject {
    func updateDataSource(with articles: [Article])
}