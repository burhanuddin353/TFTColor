//
//  ViewController.swift
//  Swift Example
//
//  Created by Burhanuddin Sunelwala on 12/9/15.
//  Copyright © 2015 Burhanuddin Sunelwala. All rights reserved.
//

import UIKit
import TFTColor

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
        
        rgbHexTextField.text = "#00ff00"
    
        colorView.backgroundColor = UIColor(rgbHexString: rgbHexTextField.text!, alpha: 1.0)
        let viewColor = colorView.backgroundColor!
        
        cmykHexTextField.text = viewColor.cmykHexString
        
        redTextField.text = "\(viewColor.redValue)"
        greenTextField.text = "\(viewColor.greenValue)"
        blueTextField.text = "\(viewColor.blueValue)"
        
        cyanTextField.text = "\(viewColor.cyanValue)"
        magentaTextField.text = "\(viewColor.magentaValue)"
        yellowTextField.text = "\(viewColor.yellowValue)"
        blackTextField.text = "\(viewColor.blackValue)"
        
        let aview = UIView(frame: CGRect(x: 15, y: 100, width: 100, height: 100))
        aview.backgroundColor = viewColor.complementary
        view.addSubview(aview)
    }
    
    @IBAction func didChange(_ textField: UITextField) {
        
        if let text = textField.text {
            
            switch textField {
                
            case rgbHexTextField:
                colorView.backgroundColor = UIColor(rgbHexString: text, alpha: 1.0)
                let viewColor = colorView.backgroundColor!
                cmykHexTextField.text = viewColor.cmykHexString
                
                redTextField.text = "\(viewColor.redValue)"
                greenTextField.text = "\(viewColor.greenValue)"
                blueTextField.text = "\(viewColor.blueValue)"
                
                cyanTextField.text = "\(viewColor.cyanValue)"
                magentaTextField.text = "\(viewColor.magentaValue)"
                yellowTextField.text = "\(viewColor.yellowValue)"
                blackTextField.text = "\(viewColor.blackValue)"
                
            case cmykHexTextField:
                colorView.backgroundColor = UIColor(cmykHexString: text, alpha: 1.0)
                let viewColor = colorView.backgroundColor!
                rgbHexTextField.text = viewColor.rgbHexString
                
                redTextField.text = "\(viewColor.redValue)"
                greenTextField.text = "\(viewColor.greenValue)"
                blueTextField.text = "\(viewColor.blueValue)"
                
                cyanTextField.text = "\(viewColor.cyanValue)"
                magentaTextField.text = "\(viewColor.magentaValue)"
                yellowTextField.text = "\(viewColor.yellowValue)"
                blackTextField.text = "\(viewColor.blackValue)"
                
            case redTextField, greenTextField, blueTextField:
                colorView.backgroundColor = UIColor(red: CGFloat(Float(redTextField.text!) ?? 0)/255.0,
                                                    green: CGFloat(Float(greenTextField.text!) ?? 0)/255.0,
                                                    blue: CGFloat(Float(blueTextField.text!) ?? 0)/255.0,
                                                    alpha: 1.0)
                let viewColor = colorView.backgroundColor!
                cmykHexTextField.text = viewColor.cmykHexString
                rgbHexTextField.text = viewColor.rgbHexString
                
                cyanTextField.text = "\(viewColor.cyanValue)"
                magentaTextField.text = "\(viewColor.magentaValue)"
                yellowTextField.text = "\(viewColor.yellowValue)"
                blackTextField.text = "\(viewColor.blackValue)"
                
            case cyanTextField, magentaTextField, yellowTextField, blackTextField:
                colorView.backgroundColor = UIColor(cyan: Float(cyanTextField.text!) ?? 0/255.0,
                                                    magenta: Float(magentaTextField.text!) ?? 0/255.0,
                                                    yellow: Float(yellowTextField.text!) ?? 0/255.0,
                                                    black: Float(blackTextField.text!) ?? 0/255.0,
                                                    alpha: 1.0)
                let viewColor = colorView.backgroundColor!
                cmykHexTextField.text = viewColor.cmykHexString
                rgbHexTextField.text = viewColor.rgbHexString
                
                redTextField.text = "\(viewColor.redValue)"
                greenTextField.text = "\(viewColor.greenValue)"
                blueTextField.text = "\(viewColor.blueValue)"
                
            default:
                colorView.backgroundColor = UIColor.white
            }
        }
    }
}




