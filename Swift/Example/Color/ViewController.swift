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
        
        rgbHexTextField.text = "#353"
        colorView.backgroundColor = UIColor(rgbHexString: rgbHexTextField.text!, alpha: 1.0)
        cmykHexTextField.text = colorView.backgroundColor?.cmykHexString
        
        redTextField.text = "\(colorView.backgroundColor!.red)"
        greenTextField.text = "\(colorView.backgroundColor!.green)"
        blueTextField.text = "\(colorView.backgroundColor!.blue)"
        
        cyanTextField.text = "\(colorView.backgroundColor!.cyan)"
        magentaTextField.text = "\(colorView.backgroundColor!.magenta)"
        yellowTextField.text = "\(colorView.backgroundColor!.yellow)"
        blackTextField.text = "\(colorView.backgroundColor!.black)"
    }
    
    @IBAction func didChange(_ textField: UITextField) {
        
        if let text = textField.text {
            
            switch textField {
                
            case rgbHexTextField:
                colorView.backgroundColor = UIColor(rgbHexString: text, alpha: 1.0)
                cmykHexTextField.text = colorView.backgroundColor!.cmykHexString
                
                redTextField.text = "\(colorView.backgroundColor!.red)"
                greenTextField.text = "\(colorView.backgroundColor!.green)"
                blueTextField.text = "\(colorView.backgroundColor!.blue)"
                
                cyanTextField.text = "\(colorView.backgroundColor!.cyan)"
                magentaTextField.text = "\(colorView.backgroundColor!.magenta)"
                yellowTextField.text = "\(colorView.backgroundColor!.yellow)"
                blackTextField.text = "\(colorView.backgroundColor!.black)"
                
            case cmykHexTextField:
                colorView.backgroundColor = UIColor(cmykHexString: text, alpha: 1.0)
                rgbHexTextField.text = colorView.backgroundColor!.rgbHexString
                
                redTextField.text = "\(colorView.backgroundColor!.red)"
                greenTextField.text = "\(colorView.backgroundColor!.green)"
                blueTextField.text = "\(colorView.backgroundColor!.blue)"
                
                cyanTextField.text = "\(colorView.backgroundColor!.cyan)"
                magentaTextField.text = "\(colorView.backgroundColor!.magenta)"
                yellowTextField.text = "\(colorView.backgroundColor!.yellow)"
                blackTextField.text = "\(colorView.backgroundColor!.black)"
                
            case redTextField, greenTextField, blueTextField:
                colorView.backgroundColor = UIColor(red: CGFloat(Float(redTextField.text!) ?? 0)/255.0,
                                                    green: CGFloat(Float(greenTextField.text!) ?? 0)/255.0,
                                                    blue: CGFloat(Float(blueTextField.text!) ?? 0)/255.0,
                                                    alpha: 1.0)
                cmykHexTextField.text = colorView.backgroundColor!.cmykHexString
                rgbHexTextField.text = colorView.backgroundColor!.rgbHexString
                
                cyanTextField.text = "\(colorView.backgroundColor!.cyan)"
                magentaTextField.text = "\(colorView.backgroundColor!.magenta)"
                yellowTextField.text = "\(colorView.backgroundColor!.yellow)"
                blackTextField.text = "\(colorView.backgroundColor!.black)"
                
            case cyanTextField, magentaTextField, yellowTextField, blackTextField:
                colorView.backgroundColor = UIColor(cyan: (Float(cyanTextField.text!) ?? 0)/255.0,
                                                    magenta: (Float(magentaTextField.text!) ?? 0)/255.0,
                                                    yellow: (Float(yellowTextField.text!) ?? 0)/255.0,
                                                    black: (Float(blackTextField.text!) ?? 0)/255.0,
                                                    alpha: 1.0)
                cmykHexTextField.text = colorView.backgroundColor?.cmykHexString
                rgbHexTextField.text = colorView.backgroundColor?.rgbHexString
                
                redTextField.text = "\(colorView.backgroundColor!.red)"
                greenTextField.text = "\(colorView.backgroundColor!.green)"
                blueTextField.text = "\(colorView.backgroundColor!.blue)"
                
            default:
                colorView.backgroundColor = UIColor.white
            }
        }
    }
}




