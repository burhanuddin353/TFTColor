//
//  TFTColor.swift
//  Swift Example
//
//  Created by Burhanuddin Sunelwala on 12/9/15.
//  Copyright © 2015 Burhanuddin Sunelwala. All rights reserved.
//

import UIKit

extension UIColor {
    
    //MARK: Private Helper Methods
    private static func clean(_ hexString: inout String, expectedLength: Int) {
        
        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }
        else if hexString.hasPrefix("0x") || hexString.hasPrefix("0X") {
            hexString.removeSubrange(hexString.startIndex...hexString.index(hexString.startIndex, offsetBy: 1))
        }
        
        //Check for Special Characters. Truncate the string from first special character.
        let characterSet = CharacterSet(charactersIn: "abcdefABCDEF1234567890").inverted
        if let firstInvalidCharPosition = hexString.rangeOfCharacter(from: characterSet)?.lowerBound {
            hexString.removeSubrange(firstInvalidCharPosition..<hexString.endIndex)
        }

        //Repeat the characters if they are half of expected length. 
        //Example(RGB): 353 -> 335533
        if hexString.characters.count == expectedLength/2 {
            
            for i in 0..<expectedLength/2 {
                
                let index = hexString.index(hexString.startIndex, offsetBy: i*2)
                hexString.insert(hexString[index], at: index)
            }
        }
        //Append leading zeros if the length is less than the expected length
        //Example(RGB): 5C -> 00005C
        else if hexString.characters.count < expectedLength {
            while hexString.characters.count != expectedLength {
                hexString.insert("0", at: hexString.startIndex)
            }
        }
        //Truncate the excess string if length is greater than expected length
        //Example(RGB): FFDF00321 -> FFDF00
        else if hexString.characters.count > expectedLength {
            hexString.removeSubrange(hexString.index(hexString.startIndex, offsetBy: expectedLength)..<hexString.endIndex)
        }
    }
    
    private static func hexValue(from hexString: String) -> UInt32 {
        
        var hexValue: UInt32 = 0
        Scanner(string: hexString).scanHexInt32(&hexValue)
        return hexValue
    }
    
    private var rgbComponents: [CGFloat] {
        
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return [red, green, blue]
    }
    
    private var cmykComponents: [CGFloat] {
        
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        let black = 1 - max(max(red, green), blue)
        let cyan =  (1 - red - black) / (1 - black)
        let magenta =  (1 - green - black) / (1 - black)
        let yellow =  (1 - blue - black) / (1 - black)
        
        return [cyan, magenta, yellow, black]
    }
    
    //MARK: Public Methods
    //MARK: RGB
    convenience init(rgbHexString: String, alpha: Float) {
        
        UIColor.clean(&rgbHexString, expectedLength: 6)
        self.init(rgbHexValue: UIColor.hexValue(from: hex), alpha: alpha)
    }
    
    convenience init(rgbHexValue: UInt32, alpha: Float) {
        self.init(red: CGFloat((rgbHexValue & 0xFF0000) >> 16)/255.0, green: CGFloat((rgbHexValue & 0xFF00) >> 8)/255.0, blue: CGFloat(rgbHexValue & 0xFF)/255.0, alpha: CGFloat(alpha))
    }
    
    var rgbHexString: String {
        
        var hexString = ""
        for component in rgbComponents {
            hexString.append(String(UInt(component * 255), radix: 16))
        }
        return hexString
    }
    
    var rgbHexValue: UInt {
        
        let rgbValues = rgbComponents
        var hexValue: UInt = 0
        hexValue |= (UInt(rgbValues[0] * 255) << 16)
        hexValue |= (UInt(rgbValues[1] * 255) << 8)
        hexValue |= UInt(rgbValues[2] * 255)
        
        return hexValue
    }
    
    //MARK: CMYK
    convenience init(cyan: CGFloat, magenta: CGFloat, yellow: CGFloat, black: CGFloat, alpha: CGFloat) {
        
        let red = (1 - cyan) * (1 - black)
        let green = (1 - magenta) * (1 - black)
        let blue = (1 - yellow) * (1 - black)
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    convenience init(cmykHexString: inout String, alpha: Float) {
        
        UIColor.clean(&cmykHexString, expectedLength: 8)
        self.init(cmykHexValue: UIColor.hexValue(from: cmykHexString), alpha: alpha);
    }
    
    convenience init(cmykHexValue: UInt32, alpha: Float) {
        
        self.init(cyan: CGFloat((cmykHexValue & 0xFF000000) >> 32)/255.0, magenta: CGFloat((cmykHexValue & 0xFF0000) >> 16)/255.0, yellow: CGFloat((cmykHexValue & 0xFF00) >> 8)/255.0, black: CGFloat(cmykHexValue & 0xFF)/255.0, alpha: CGFloat(alpha))
    }
    
    var cmykHexString: String {
        
        var hexString = ""
        for component in cmykComponents {
            hexString.append(String(UInt(component * 255), radix: 16))
        }
        return hexString
    }
    
    var cmykHexValue: UInt {
        
        let cmykValues = cmykComponents
        var hexValue: UInt = 0
        hexValue |= UInt(cmykValues[0] * 255) << 32
        hexValue |= UInt(cmykValues[1] * 255) << 16
        hexValue |= UInt(cmykValues[2] * 255) << 8
        hexValue |= UInt(cmykValues[2] * 255)
        
        return hexValue
    }
}
