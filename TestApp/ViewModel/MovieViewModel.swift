//
//  Course.swift
//  TestApp
//
//  Created by SOFTONE on 4/29/20.
//  Copyright © 2020 SOFTONE. All rights reserved.
//

import Foundation
import Moya

class MovieViewModel:ObservableObject {
    @Published var listMovie: [Movie] = []
    @Published var page: Int = 1
    @Published var isLastPage: Bool = false
    
    func fetchMovies() {
        API.getInstance().movieManager.getNewMovies(page: self.page, completion: {
            response in
            print(response)
            self.listMovie.append(contentsOf: response.movies)
            if(response.page == 4) {
                self.isLastPage = true
            }
            self.page+=1
        })
    }
}
