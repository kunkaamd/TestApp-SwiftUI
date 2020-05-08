//
//  SwiftUIView.swift
//  TestApp
//
//  Created by SOFTONE on 5/5/20.
//  Copyright © 2020 SOFTONE. All rights reserved.
//

import SwiftUI

struct CustomController: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UIViewController {
        let storyboard = UIStoryboard(name: "Custom", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(identifier: "CustomID")
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}

struct CustomView: View {
    var body: some View {
        CustomController()
    }
}
