//
//  RequestHandling.swift
//  PolarstepsLigthClone
//
//  Created by jorge enrique caicedo cuero on 08/12/2022.
//

import Foundation

public protocol RequestHandling {
    func request<T>(request: URLRequest, dataType: T.Type) async -> Result<T, RequestError> where T: Decodable
}
