//
//  ServiceRoute.swift
//  Movies
//
//  Created by Mariaelena Silveira on 10/03/22.
//

import Foundation

enum ServiceRoute {
    case movie(Int32)
    case popularMovie(Int)
    case search(String, Int)
}

extension ServiceRoute: ServiceRouteProtocol {
    
    var scheme: String {
        return "https"
    }

    var path: String{
        switch self {
        case .movie(let id):
            return "/3/movie/\(id)"
        case .popularMovie:
            return "/3/movie/popular"
        case .search:
            return "/3/search/movie"
        }
    }

    var host: String {
        return "api.themoviedb.org"
    }

    var method: HTTPMethod {
        return .get
    }
    
    var body: [String : String]? {
        return nil
    }
}
