//
//  MultiComponentPickerController.swift
//  Lab02
//
//  Created by Apeksha Parmar on 2022-10-22.
//

import UIKit

class MultiComponentPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var MultiPickerViewControl: UIPickerView!
    
    let Red = ColourChannel.Red
    let Blue = ColourChannel.Blue
    let Green = ColourChannel.Green
    
    var ValueArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildValueArray()
        
        MultiPickerViewControl.selectRow(255, inComponent: Red.rawValue, animated: true)
        MultiPickerViewControl.selectRow(255, inComponent: Blue.rawValue, animated: true)
        MultiPickerViewControl.selectRow(255, inComponent: Green.rawValue, animated: true)
    }
    
    func buildValueArray()
    {
        for index in stride(from: 255, through: 0, by: -1)
        {
            ValueArray.append(String(index))
        }
    }
    

    @IBAction func SelectButton_Pressed(_ sender: UIButton) {
        let RedChannelIndex = MultiPickerViewControl.selectedRow(inComponent: Red.rawValue)
        let BlueChannelIndex = MultiPickerViewControl.selectedRow(inComponent: Blue.rawValue)
        let GreenChannelIndex = MultiPickerViewControl.selectedRow(inComponent: Green.rawValue)
        
        let RedChannel = CGFloat((ValueArray[RedChannelIndex] as NSString).floatValue)/255.0
        let BlueChannel = CGFloat((ValueArray[BlueChannelIndex] as NSString).floatValue)/255.0
        let GreenChannel = CGFloat((ValueArray[GreenChannelIndex] as NSString).floatValue)/255.0
        
        let picker = UIColorPickerViewController()
        picker.selectedColor = UIColor(red: RedChannel, green: GreenChannel, blue: BlueChannel, alpha: 1.0)

        self.present(picker, animated: true, completion: nil)
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
