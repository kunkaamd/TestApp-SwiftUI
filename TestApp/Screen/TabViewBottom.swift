//
//  LandmarkList.swift
//  TestApp
//
//  Created by SOFTONE on 4/24/20.
//  Copyright © 2020 SOFTONE. All rights reserved.
//


import SwiftUI

struct TabViewBottom: View {
    @Binding var showMenu: Bool
    @EnvironmentObject var userData: UserData
    @State var showsAlert = false
    var body: some View {
        NavigationView {
            TabView {
                LandmarkList().tabItem {
                    Image(systemName: "1.square.fill")
                    Text("ListView Landmark")
                }
                MovieView().tabItem{
                    Image(systemName: "2.square.fill")
                    Text("ListView Movie")
                }.environmentObject(MovieViewModel())
                CustomView().tabItem {
                    Image(systemName: "3.square.fill")
                    Text("StoryBoard")
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

struct TabViewBottom_Previews: PreviewProvider {
    static var previews: some View {
        Text("123")
    }
}
