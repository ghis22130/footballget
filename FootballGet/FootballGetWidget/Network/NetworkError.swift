//
//  NetworkError.swift
//  FootballGet
//
//  Created by 지북 on 2021/10/14.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case badRequest
    case unexpectedResponse
    case decodingError(String)
    case unexpectedError
    case httpCode(Int)
    case emptyData
}
