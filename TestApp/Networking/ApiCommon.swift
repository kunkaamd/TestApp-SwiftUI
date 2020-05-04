//
//  ApiCommon.swift
//  TestApp
//
//  Created by SOFTONE on 5/4/20.
//  Copyright © 2020 SOFTONE. All rights reserved.
//

import Foundation
import Moya

struct API {
    var movieManager: MoviesNetworkManager
    //declare more in this
    
    private init() {
        movieManager = MoviesNetworkManager()
    }
    
    static func getInstance() -> API{
        return API()
    }
}
