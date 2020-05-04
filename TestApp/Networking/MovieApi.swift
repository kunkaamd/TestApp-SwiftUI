//
//  MovieApi.swift
//  TestApp
//
//  Created by SOFTONE on 5/4/20.
//  Copyright © 2020 SOFTONE. All rights reserved.
//

import Foundation
import Moya

enum MovieApi {
    case recommended(id:Int)
    case popular(page:Int)
    case newMovies(page:Int)
    case video(id:Int)
}

let MovieAPIKey = "fde2e1751490d72b62ac0ffb0086b482"

extension MovieApi: TargetType {
    var baseURL: URL {
        guard let url = URL(string: EnvironmentBaseURL.baseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .recommended(let id):
            return "\(id)/recommendations"
        case .popular:
            return "popular"
        case .newMovies:
            return "now_playing"
        case .video(let id):
            return "\(id)/videos"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .recommended, .popular, .newMovies, .video:
            return .get
//        case .createSomething:
//            return .post
        default: return .get
        }
        
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .recommended, .video:
            return .requestParameters(parameters: ["api_key":  MovieAPIKey], encoding: URLEncoding.queryString)
        case .popular(let page), .newMovies(let page):
            return .requestParameters(parameters: ["page":page, "api_key": MovieAPIKey], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
}
