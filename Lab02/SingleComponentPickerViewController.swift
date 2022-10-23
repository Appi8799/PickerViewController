//
//  SingleComponentPickerViewController.swift
//  Lab02
//
//  Created by Apeksha Parmar on 2022-10-22.
//

import UIKit

class SingleComponentPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let Red = ColourChannel.Red
    
    var ValueArray: [String] = []
    
    @IBOutlet weak var SinglePickerViewControl: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildValueArray()
        
        SinglePickerViewControl.selectRow(100, inComponent: Red.rawValue, animated: true)
    }
    
    @IBAction func SelectButton_Pressed(_ sender: UIButton) {
        let RedChannelIndex = SinglePickerViewControl.selectedRow(inComponent: Red.rawValue)
        
        let RedChannel = CGFloat((ValueArray[RedChannelIndex] as NSString).floatValue)/100.0
    }
    
    func buildValueArray()
    {
        for index in stride(from: 100, through: 0, by: -1)
        {
            ValueArray.append(String(index))
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ValueArray[row]
    }
}
