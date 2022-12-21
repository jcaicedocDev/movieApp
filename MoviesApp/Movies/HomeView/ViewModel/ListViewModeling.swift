//
//  ListViewModeling.swift
//  MoviesApp
//
//  Created by jorge enrique caicedo cuero on 13/12/2022.
//

import Foundation

protocol ListViewModeling: ObservableObject {
    associatedtype DataItem
    
    var datasource: DataItem? { get }
    var movieIdSelected: Int { get set }
    var showError: Bool { get set }
    var errorMessage: String? { get }
    var isLoading: Bool { get }
    func loadData()
}
