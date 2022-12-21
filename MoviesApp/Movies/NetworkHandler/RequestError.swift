//
//  RequestError.swift
//  PolarstepsLigthClone
//
//  Created by jorge enrique caicedo cuero on 08/12/2022.
//

import Foundation

public enum RequestError: Error {
    case unknownStatusCode
    case unexpectedStatusCode(code: Int)
    case contentEmptyData
    case contentDecoding
}

extension RequestError: CustomStringConvertible {
    public var description: String {
        switch self {
        case .unknownStatusCode:
            return "The status code is unknown"
        case let .unexpectedStatusCode(errorCode):
            return "The status code is unexpected: \(errorCode)"
        case .contentEmptyData:
            return "The content data is empty"
        case .contentDecoding:
            return "Error while decoding data"
        }
    }
}
