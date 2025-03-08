//
//  NetworkError.swift
//  FoodicsRecipes
//
//  Created by Amer Alyusuf on 06/03/2025.
//

import Foundation

struct ErrorResponse: Codable, Equatable {
    let statusCode: Int?
    let title: String?
    let type: String?
    let detail: String?
    let message: String?

    enum CodingKeys: String, CodingKey {
        case statusCode = "status"
        case title
        case type
        case detail
        case message
    }

    static func == (lhs: ErrorResponse, rhs: ErrorResponse) -> Bool {
        return lhs.statusCode == rhs.statusCode &&
               lhs.title == rhs.title &&
               lhs.type == rhs.type &&
               lhs.detail == rhs.detail &&
               lhs.message == rhs.message
    }
}


enum NetworkError: Error, Equatable {
    case badRequest
    case decodingError(Error)
    case invalidResponse
    case errorResponse(ErrorResponse)

    static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
        switch (lhs, rhs) {
        case (.badRequest, .badRequest), (.invalidResponse, .invalidResponse):
            return true
        case (.decodingError, .decodingError):
            return true
        case (.errorResponse(let lhsError), .errorResponse(let rhsError)):
            return lhsError.statusCode == rhsError.statusCode &&
                   lhsError.message == rhsError.message
        default:
            return false
        }
    }
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .badRequest:
            return "Bad Request"
        case .decodingError(let error):
            return "Decoding Error: \(error.localizedDescription)"
        case .invalidResponse:
            return "Invalid Response"
        case .errorResponse(let errorResponse):
            return "Error Response: \(errorResponse.message ?? "")\n\(errorResponse.detail ?? "")"
        }
    }
}
