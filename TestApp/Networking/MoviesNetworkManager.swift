//
//  NetworkManager.swift
//  TestApp
//
//  Created by SOFTONE on 5/4/20.
//  Copyright © 2020 SOFTONE. All rights reserved.
//
import Foundation
import Moya


fileprivate protocol Networkable {
    var provider: MoyaProvider<MovieApi> {get}
    func getNewMovies(page: Int, completion: @escaping ((MovieResults)->()))
}

struct MoviesNetworkManager: Networkable {
    var provider: MoyaProvider<MovieApi> = MoyaProvider<MovieApi>(plugins: [NetworkLoggerPlugin()])
    
    func getNewMovies(page: Int, completion: @escaping ((MovieResults) -> ())) {
        provider.request(.newMovies(page: page)) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(MovieResults.self, from: response.data)
                    completion(results)
                } catch let err {
                    print(err)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}
