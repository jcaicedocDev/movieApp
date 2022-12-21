//
//  DetailViewModeling.swift
//  MoviesApp
//
//  Created by jorge enrique caicedo cuero on 18/12/2022.
//

import Foundation

protocol DetailViewModeling: ObservableObject {
    associatedtype DataItem

    var datasource: DataItem? { get }
    var showError: Bool { get set }
    var errorMessage: String? { get }
    var isLoading: Bool { get }
    var castTitle: String { get }
    var recomendationTitle: String { get }
    func loadData()
}
