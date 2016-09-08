//
//  ViewController.swift
//  Swift Example
//
//  Created by Burhanuddin Sunelwala on 12/9/15.
//  Copyright © 2015 Burhanuddin Sunelwala. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(rgbHexString: "#353", alpha: 1.0)
        print("RGB Hex String "+view.backgroundColor!.rgbHexString)
        print("RGB Hex Value \(view.backgroundColor!.rgbHexValue)")
        print("CMYK Hex String "+view.backgroundColor!.cmykHexString)
        print("CMYK Hex Value \(view.backgroundColor!.cmykHexValue)")
    }
}


