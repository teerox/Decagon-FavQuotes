//
//  Network.swift
//  FavQuotes
//
//  Created by Anthony Odu on 28/04/2021.
//

import Foundation

class APIManger {
    typealias Parameters = [String: Any]
    enum ApiResult {
        case success(Data)
        case failure(RequestError)
    }
    enum HTTPMethod: String {
        case options = "OPTIONS"
        case get     = "GET"
        case head    = "HEAD"
        case post    = "POST"
        case put     = "PUT"
        case patch   = "PATCH"
        case delete  = "DELETE"
        case trace   = "TRACE"
        case connect = "CONNECT"
    }
    enum RequestError: Error {
        case unknownError
        case connectionError
        case authorizationError
        case invalidRequest
        case notFound
        case invalidResponse
        case serverError
        case serverUnavailable
    }
    static func requestData(url: String, method: HTTPMethod, parameters: Parameters?,
                            completion: @escaping (ApiResult) -> Void) {
        let baseUrl = Environment.rootURL.absoluteString
        let header = [
            "x-rapidapi-key": Environment.apiKey,
            "x-rapidapi-host": "healthruwords.p.rapidapi.com"
        ]
        var urlRequest = URLRequest(url: URL(string: baseUrl+url)!,
                                    cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        urlRequest.allHTTPHeaderFields = header
        urlRequest.httpMethod = method.rawValue
        if let parameters = parameters {
            let parameterData = parameters.reduce("") { (result, param) -> String in
                return result + "&\(param.key)=\(param.value as? String)"
            }.data(using: .utf8)
            urlRequest.httpBody = parameterData
        }
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print(error)
                completion(ApiResult.failure(.connectionError))
            } else if let data = data, let responseCode = response as? HTTPURLResponse {
                switch responseCode.statusCode {
                case 200...201:
                    completion(ApiResult.success(data))
                case 400...499:
                    completion(ApiResult.failure(.authorizationError))
                case 500...599:
                    completion(ApiResult.failure(.serverError))
                default:
                    completion(ApiResult.failure(.unknownError))
                }
            }
        }.resume()
    }
}
