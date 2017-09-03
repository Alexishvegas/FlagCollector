//
//  FlagViewController.swift
//  FlagCollector
//
//  Created by Alexis on 9/2/17.
//  Copyright © 2017 Alexis. All rights reserved.
//

import UIKit

class FlagViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var flagImageView: UIImageView!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imagePicker.delegate = self
        
        
    }
    
    @IBAction func addTapped(_ sender: Any)
    {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let flag = Flag(context: context)
        flag.title = titleTextField.text
        flag.image = UIImagePNGRepresentation(flagImageView.image!) as! NSData
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
        
    }

    @IBAction func photosTapped(_ sender: Any)
    {
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        flagImageView.image = image
        
        imagePicker.dismiss(animated: true, completion: nil)
        
    }

    @IBAction func cameraTapped(_ sender: Any)
    {
        
    }

}
