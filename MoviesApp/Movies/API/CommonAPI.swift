//
//  CommonAPI.swift
//  MoviesApp
//
//  Created by jorge enrique caicedo cuero on 13/12/2022.
//

import Foundation

enum CommonAPI {
    static let supportedLanguages = Set(Bundle.main.localizations)

    static let requestDefaultTimeout: TimeInterval = 60

    static var baseURL: String {
        let apiBaseURL: String = try! PlistReader.value(for: "API_BASE_URL")
        let apiVersion: String = try! PlistReader.value(for: "API_VERSION")
        return "https://\(apiBaseURL)/\(apiVersion)"
    }
    
    static var baseImagesURL: String {
        let apiBaseURL: String = try! PlistReader.value(for: "API_IMAGES_BASE_URL")
        return "https://\(apiBaseURL)"
    }

    static var apiKey: String {
        try! PlistReader.value(for: "API_KEY")
    }

    static var language: String {
        guard let current = Locale.current.languageCode,
              CommonAPI.supportedLanguages.contains(current) else {
            return "en"
        }

        return current
    }

    static var queryItems: [URLQueryItem] {
        let apiKeyItem = URLQueryItem(name: "api_key", value: CommonAPI.apiKey)
        let language = URLQueryItem(name: "language", value: CommonAPI.language)
        return [apiKeyItem, language]
    }

    static func generateURL(with path: String, queryParameters: [URLQueryItem]?) -> URL? {
        let urlComponents = URLComponents(string: baseURL)
        guard var components = urlComponents else {
          return URL(string: baseURL)
        }

        components.path = components.path.appending(path)

        guard let queryParams = queryParameters else {
          return components.url
        }

        if components.queryItems == nil {
          components.queryItems = []
        }

        components.queryItems?.append(contentsOf: queryParams)

        return components.url
    }
}
