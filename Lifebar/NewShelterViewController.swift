//
//  NewShelterViewController.swift
//  Lifebar
//
//  Created by Timbology on 23/05/2018.
//  Copyright © 2018 Timbology. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class NewShelterViewController: UIViewController {
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var bioTF: UITextField!
    @IBOutlet weak var longTF: UITextField!
    @IBOutlet weak var latTF: UITextField!
    @IBOutlet weak var webTF: UITextField!
    @IBOutlet weak var targetTF: UITextField!
    
    var ref: DatabaseReference?

    @IBAction func uploadButton(_ sender: Any) {
        
        ref?.child("Shelters").childByAutoId().setValue("test")
        let shelterRef = Database.database().reference().child("shelter").childByAutoId()
        
        let shelterObject = [
            "name": nameTF.text,
            "bio": bioTF.text,
            "lng": longTF.text,
            "lat": latTF.text,
            "web": webTF.text,
            "target": targetTF.text
        ]
        
        shelterRef.setValue(shelterObject, withCompletionBlock: { error, ref in
            if error == nil {
                self.dismiss(animated: true, completion: nil)
            } else {
                //Handle error
            }
        })
        
    }
    
    
    
    
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        ref = Database.database().reference()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
