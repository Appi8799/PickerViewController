//
//  ImageComponentPickerViewController.swift
//  Lab02
//
//  Created by Apeksha Parmar on 2022-10-22.
//

import UIKit

class ImageComponentPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var ImagePickerViewControl: UIPickerView!
    @IBOutlet weak var ImagePickerViewControllerLabel: UILabel!
    
    let Red = ColourChannel.Red
    let Blue = ColourChannel.Blue
    
    var ValueArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildValueArray()
        
        ImagePickerViewControl.selectRow(255, inComponent: Red.rawValue, animated: true)
        ImagePickerViewControl.selectRow(255, inComponent: Blue.rawValue, animated: true)
        
    }
    
    func buildValueArray()
    {
        for index in stride(from: 255, through: 0, by: -1)
        {
            ValueArray.append(String(index))
        }
    }
    
    @IBAction func SelectButton_Pressed(_ sender: UIButton) {
        
        let RedChannelIndex = ImagePickerViewControl.selectedRow(inComponent: Red.rawValue)
        let BlueChannelIndex = ImagePickerViewControl.selectedRow(inComponent: Blue.rawValue)
        
        let RedChannel = CGFloat((ValueArray[RedChannelIndex] as NSString).floatValue)/255.0
        let BlueChannel = CGFloat((ValueArray[BlueChannelIndex] as NSString).floatValue)/255.0
        
        ImagePickerViewControllerLabel.text = "Image Component Picker View Controller"
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
    

