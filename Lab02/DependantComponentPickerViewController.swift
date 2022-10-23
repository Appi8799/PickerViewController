//
//  DependantComponentPickerViewController.swift
//  Lab02
//
//  Created by Apeksha Parmar on 2022-10-22.
//

import UIKit

class DependantComponentPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var DependentPickerViewControl: UIPickerView!
    @IBOutlet weak var DependentPickerViewControllerLabel: UILabel!
    
    let Red = ColourChannel.Red
    let Blue = ColourChannel.Blue
    
    var ValueArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildValueArray()
        
        DependentPickerViewControl.selectRow(255, inComponent: Red.rawValue, animated: true)
        DependentPickerViewControl.selectRow(255, inComponent: Blue.rawValue, animated: true)
        
    }
    
    func buildValueArray()
    {
        for index in stride(from: 255, through: 0, by: -1)
        {
            ValueArray.append(String(index))
        }
    }
    
    @IBAction func SelectButton_Pressed(_ sender: UIButton) {
        
        let RedChannelIndex = DependentPickerViewControl.selectedRow(inComponent: Red.rawValue)
        let BlueChannelIndex = DependentPickerViewControl.selectedRow(inComponent: Blue.rawValue)
        
        let RedChannel = CGFloat((ValueArray[RedChannelIndex] as NSString).floatValue)/255.0
        let BlueChannel = CGFloat((ValueArray[BlueChannelIndex] as NSString).floatValue)/255.0
        
        DependentPickerViewControllerLabel.text = "Dependent Component Picker View Controller"
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 256
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ValueArray[row]
    }
    

}
