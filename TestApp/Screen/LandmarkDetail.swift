//
//  LandmarkDetail.swift
//  TestApp
//
//  Created by SOFTONE on 4/24/20.
//  Copyright © 2020 SOFTONE. All rights reserved.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var userData: UserData
    
    var landmarkIndex: Int{
        userData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var landmark: Landmark;
    var body: some View {
        VStack {
            VStack() {
                MapView(landmark: landmark)
                    .frame(height: 300)
                CircleImage(width: Int(UIScreen.main.bounds.width * 0.5),lardmark: landmark).padding(.bottom, -150).offset(y: -150)
            }
            
            Button(action: {
                self.userData.landmarks[self.landmarkIndex].isFavorite.toggle()
            }) {
                if self.userData.landmarks[self.landmarkIndex].isFavorite {
                    Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                } else {
                    Image(systemName: "star")
                        .foregroundColor(Color.gray)
                }
            }
            
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                HStack(alignment: .top) {
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer()
                    Text(landmark.state)
                        .font(.subheadline)
                }
            }
            .padding()
            Button(action: {
                self.userData.test+=1
            }) {
                Text(String(userData.test))
            }
            Spacer()
        }.edgesIgnoringSafeArea(.top)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarkData[0]).environmentObject(UserData())
    }
}
