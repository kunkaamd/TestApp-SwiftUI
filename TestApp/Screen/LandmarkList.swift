//
//  LandmarkList.swift
//  TestApp
//
//  Created by SOFTONE on 4/24/20.
//  Copyright © 2020 SOFTONE. All rights reserved.
//


import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var userData: UserData
    @State var showsAlert = false
    var body: some View {
        List {
            Toggle(isOn: $userData.showFavoritesOnly) {
                Text("Favorites only")
            }
            ForEach(userData.landmarks) {landmark in
                if (!self.userData.showFavoritesOnly || landmark.isFavorite) {
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)){
                        LandmarkRow(landmark: landmark)
                    }.onAppear {
                        if (landmark.id == self.userData.landmarks.last?.id) {
                            self.showsAlert = true
                        }
                    }.alert(isPresented: self.$showsAlert) {
                        Alert(title: Text("Is Last Page"))
                    }
                }
            }
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        Text("123")
    }
}
