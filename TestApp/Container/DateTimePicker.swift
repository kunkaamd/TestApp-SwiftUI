//
//  DateTimePicker.swift
//  TestApp
//
//  Created by SOFTONE on 5/7/20.
//  Copyright © 2020 SOFTONE. All rights reserved.
//

import SwiftUI
import DateTimePicker

struct TimePicker: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView {
        let min = Date().addingTimeInterval(-60 * 60 * 24 * 4)
        let max = Date().addingTimeInterval(60 * 60 * 24 * 4)
        let picker = DateTimePicker.create(minimumDate: min, maximumDate: max)
        picker.dateFormat = "hh:mm:ss aa dd/MM/YYYY"
        
        picker.includesMonth = true
        picker.includesSecond = true
        picker.highlightColor = UIColor(red: 255.0/255.0, green: 138.0/255.0, blue: 138.0/255.0, alpha: 1)
        picker.doneButtonTitle = "!! DONE DONE !!"
        picker.doneBackgroundColor = UIColor(red: 255.0/255.0, green: 138.0/255.0, blue: 138.0/255.0, alpha: 1)
        picker.customFontSetting = DateTimePicker.CustomFontSetting(selectedDateLabelFont: .boldSystemFont(ofSize: 20))
        
        return picker
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
    
}

struct TimePicker_Previews: PreviewProvider {
    static var previews: some View {
        TimePicker()
    }
}
