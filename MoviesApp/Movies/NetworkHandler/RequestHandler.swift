//
//  RequestHandler.swift
//  PolarstepsLigthClone
//
//  Created by jorge enrique caicedo cuero on 08/12/2022.
//

import Foundation

class RequestHandler: RequestHandling {
    let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func request<T>(request: URLRequest, dataType: T.Type) async -> Result<T, RequestError> where T: Decodable{
        do {
            let (data, response) = try await session.data(for: request)
            try validate(response: response, statusCodes: 200..<300)
            let dataDecoded = try decode(data: data, type: dataType)
            return .success(dataDecoded)
        } catch {
            guard let requestError = error as? RequestError else {
                preconditionFailure("Invalid error for request: \(error)")
            }
            return .failure(requestError)
        }
    }
}

private extension RequestHandler {
    func validate(response: URLResponse, statusCodes: Range<Int>) throws {
        guard let httResponse = response as? HTTPURLResponse else {
            throw RequestError.unknownStatusCode
        }
        if !statusCodes.contains(httResponse.statusCode) {
            throw RequestError.unexpectedStatusCode(code: httResponse.statusCode)
        }
    }

    func decode<T: Decodable>(data: Data?, type: T.Type) throws -> T {
        guard let data = data, !data.isEmpty else {
            throw RequestError.contentEmptyData
        }
        do {
            return try JSONDecoder().decode(type, from: data)
        } catch {
            throw RequestError.contentDecoding
        }
    }
}
