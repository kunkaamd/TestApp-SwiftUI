//
//  EnviromentBaseUrl.swift
//  TestApp
//
//  Created by SOFTONE on 5/4/20.
//  Copyright © 2020 SOFTONE. All rights reserved.
//

import Foundation

enum EnvironmentApp {
    case production
    case staging
    case test
}

fileprivate let currentEnviroment = EnvironmentApp.staging

struct EnvironmentBaseURL {

    static var baseURL : String {
        switch currentEnviroment {
        case EnvironmentApp.production:
            return "https://api.themoviedb.org/3/movie/"
        case EnvironmentApp.staging:
            return "https://api.themoviedb.org/3/movie/"
        default:
            return "https://api.themoviedb.org/3/movie/"
        }
    }
}
