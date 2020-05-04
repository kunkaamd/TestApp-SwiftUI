//
//  UserData.swift
//  TestApp
//
//  Created by SOFTONE on 4/27/20.
//  Copyright © 2020 SOFTONE. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject  {
    @Published var showFavoritesOnly = false
    @Published var showMenu = false
    @Published var landmarks: Array<Landmark> = landmarkData
    @Published var test: Int = 0
}
