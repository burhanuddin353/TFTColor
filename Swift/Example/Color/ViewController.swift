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
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor.colorWithRGB(hexString: "3533", alpha: 1.0)
        var count: UInt32 = 0
        for i in 0..<Int(view.bounds.size.width) {
            for j in 0..<Int(view.bounds.size.height) {
                
                let view1 = UIView(frame: CGRect(origin: CGPoint(x: i, y: j), size: CGSize(width: 1.0, height: 1.0)))
                let x: UInt32 = UInt32(i) + UInt32(j)
                view1.backgroundColor = UIColor.colorWithRGB(hexValue: x, alpha: 1.0)
                view.addSubview(view1)
                count += 1
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

