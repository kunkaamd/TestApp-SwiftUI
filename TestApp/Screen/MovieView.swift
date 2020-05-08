//
//  MovieView.swift
//  TestApp
//
//  Created by SOFTONE on 4/29/20.
//  Copyright © 2020 SOFTONE. All rights reserved.
//

import SwiftUI

struct MovieView: View {
    @EnvironmentObject var movieViewModel: MovieViewModel
    
    var body: some View {
        VStack {
            TimePicker()
            List(movieViewModel.listMovie, id: \.id) { movie in
                Text(movie.title ?? "khong ten")
                    .onAppear{
                        if(self.movieViewModel.listMovie.last?.id == movie.id && !self.movieViewModel.isLastPage ) {
                            self.movieViewModel.fetchMovies()
                        }
                }
            }.onAppear {
                if(!self.movieViewModel.isLastPage) {
                    self.movieViewModel.fetchMovies()
                }
            }
        }
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        Text("None")
    }
}
