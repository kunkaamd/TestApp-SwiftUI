//
//  LandmarkList.swift
//  TestApp
//
//  Created by SOFTONE on 4/24/20.
//  Copyright © 2020 SOFTONE. All rights reserved.
//


import SwiftUI

struct LandmarkList: View {
    @Binding var showMenu: Bool
    @EnvironmentObject var userData: UserData
    @State var showsAlert = false
    var body: some View {
        NavigationView {
            TabView {
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
                }.tabItem {
                    Image(systemName: "1.square.fill")
                    Text("ListView Landmark")
                }
                Text("This is a content tabs 2").tabItem{
                    Image(systemName: "3.square.fill")
                    Text("Tab2")
                }
            }
            .navigationBarTitle("Title", displayMode: .inline)
            .navigationBarItems(leading: (
                Button(action: {
                    withAnimation {
                        self.userData.showMenu.toggle()
                    }
                }) {
                    Image(systemName: "line.horizontal.3")
                        .imageScale(.large)
                }
            ),trailing: Button(action: {
                print("Edit button pressed...")
            }) {
                Text("Edit")
            })
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        Text("123")
    }
}
