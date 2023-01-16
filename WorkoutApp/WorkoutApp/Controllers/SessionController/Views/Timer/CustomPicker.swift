//
//  CustomPicker.swift
//  WorkoutApp
//
//  Created by Vladyslav Moroz on 16/01/2023.
//

import UIKit

final class CustomUiPickerView: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {
    var minutesArray = Array(0...59)
    var secondsArray = Array(0...59)
    var valueChanged: ((_ minutes: String, _ seconds: String, _ result: Int) -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
        self.dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return minutesArray.count
        } else {
            return secondsArray.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return String(format: "%02d", minutesArray[row])
        } else {
            return String(format: "%02d", secondsArray[row])
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let minutes = String(format: "%02d", selectedRow(inComponent: 0))
        let seconds = String(format: "%02d", selectedRow(inComponent: 1))
        let result = (Int(minutes)! * 60) + Int(seconds)!
        valueChanged?(minutes, seconds, result)
        }
    
}
