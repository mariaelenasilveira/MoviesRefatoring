//
//  ServiceRouteProtocol.swift
//  Movies
//
//  Created by Mariaelena Silveira on 10/03/22.
//

import Foundation

protocol ServiceRouteProtocol {
    
    var scheme: String            { get }
    var host: String              { get }
    var method: HTTPMethod        { get }
    var query: [String:String]?   { get }
    var path: String              { get }
    var headers: [String:String]? { get }
    var body: [String: String]?   { get }

}

extension ServiceRouteProtocol {
    
    private var urlComponents: URLComponents {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = query?.map {
            URLQueryItem(name: $0, value: $1)
        }
        return components
    }
    
    var request: URLRequest? {
        guard let url = urlComponents.url else { return nil }
        return URLRequest(url: url)
    }
}
