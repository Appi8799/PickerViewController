//
//  ImageComponentPickerViewController.swift
//  Lab02
//
//  Created by Apeksha Parmar on 2022-10-22.
//

import UIKit

class ImageComponentPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    

    @IBOutlet weak var ImagePickerViewControl: UIImageView!
    
    var pickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func SelectButton_Pressed(_ sender: UIButton) {
        showImagePickerOptions()
    }
    
    func imagePicker(sourceType: UIImagePickerController.SourceType) -> UIImagePickerController {
        let ImagePicker = UIImagePickerController()
        ImagePicker.sourceType = sourceType
        return ImagePicker
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    
    func showImagePickerOptions(){
        let alertVC = UIAlertController(title: "Pick a Photo", message: "Choose a picture from library or camera", preferredStyle: .actionSheet)
        
        //Image picker for camera
        let cameraAction = UIAlertAction(title: "Camera", style: .default){
            [weak self] (action) in
            
            //Capture selt to avoid retain cycles
            guard let self = self else{
                return
            }
            let cameraImagePicker = self.imagePicker(sourceType: .camera)
            self.present(cameraImagePicker, animated: true) {
                
            }
        }
        
        //Image Picker for Library
        let libraryAction = UIAlertAction(title: "Library", style: .default) { [weak self] action in
            
            //Capture selft to avoid retain cycles
            guard let self = self else {
                return
            }
            let libraryImagePicker = self.imagePicker(sourceType: .photoLibrary)
            self.present(libraryImagePicker, animated: true) {
                
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertVC.addAction(cameraAction)
        alertVC.addAction(libraryAction)
        alertVC.addAction(cameraAction)
        self.present(alertVC, animated: true, completion: nil)
    }
    
}

