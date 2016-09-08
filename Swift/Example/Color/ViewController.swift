//
//  ViewController.swift
//  Swift Example
//
//  Created by Burhanuddin Sunelwala on 12/9/15.
//  Copyright © 2015 Burhanuddin Sunelwala. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var rgbHexTextField: UITextField!
    @IBOutlet weak var cmykHexTextField: UITextField!
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    @IBOutlet weak var cyanTextField: UITextField!
    @IBOutlet weak var magentaTextField: UITextField!
    @IBOutlet weak var yellowTextField: UITextField!
    @IBOutlet weak var blackTextField: UITextField!
    @IBOutlet weak var colorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func didChange(textField: UITextField) {
        
        switch textField {
            
        case rgbHexTextField:
            colorView.backgroundColor = UIColor(rgbHexString: textField.text!, alpha: 1.0)
            
        case cmykHexTextField:
            colorView.backgroundColor = UIColor(cmykHexString: textField.text!, alpha: 1.0)
            
            // case redTextField, greenTextField, yellowTextField:
        //colorView.backgroundColor = UIColor(red: Int(redTextField.text!)/255.0, green: Int(redTextField.text!)/255.0, blue: Int(redTextField.text!)/255.0, alpha: 1.0)
        default:
            colorView.backgroundColor = UIColor.white
        }
    }
}




