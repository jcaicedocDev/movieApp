//
//  TredingMoviesApi.swift
//  MoviesApp
//
//  Created by jorge enrique caicedo cuero on 15/12/2022.
//

import Foundation

struct TredingMoviesEndpoint: APIRouting {
    var baseURL: String {
        CommonAPI.baseURL
    }

    var method: String {
        "GET"
    }

    var httpBody: Encodable? {
        nil
    }

    var headers: [String: String]? {
        ["Accept": "application/json"]
    }

    var queryParameters: [URLQueryItem]? {
        CommonAPI.queryItems
    }

    var timeout: TimeInterval? {
        30
    }

    var path: String {
        "/trending/movie/week"
    }

    func asRequest() -> URLRequest {
        guard let url = CommonAPI.generateURL(with: path, queryParameters: queryParameters) else {
            preconditionFailure("Invalid URL for route: \(self)")
        }

        var request = URLRequest(url: url)
        request.httpMethod = method
        request.allHTTPHeaderFields = headers
        request.timeoutInterval = timeout ?? CommonAPI.requestDefaultTimeout

        return request
    }
}
