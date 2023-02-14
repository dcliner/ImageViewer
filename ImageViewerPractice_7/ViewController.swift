//
//  ViewController.swift
//  ImageViewerPractice_7
//
//  Created by Derefaa Cline on 12/17/22.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var ImageView: UIImageView!
    lazy var ImPicker = UIImagePickerController()
    let alertmessage = "Please pick an image"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupPicker()
    }
    func setupPicker(){
        ImPicker.delegate = self
        ImPicker.videoQuality = UIImagePickerController.QualityType.typeMedium
    }

    @IBAction func Tapme(_ sender: Any) {
        present(ImPicker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let img = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        dismiss(animated: true){
            self.ImageView.image = img
        }
    }
    func showAlert() {
        let alert = UIAlertController.init(title: "Warning", message: alertmessage, preferredStyle: UIAlertController.Style.alert)
        let alertAction =  UIAlertAction.init(title: "OK", style: .default){ _ in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(alertAction)
        present(alert, animated: true)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true){
            self.showAlert()
        }
    }
    
}

