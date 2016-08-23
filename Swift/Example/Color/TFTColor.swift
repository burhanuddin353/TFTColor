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
    static func clean(_ hexString: inout String, expectedLength: Int) {
        
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
    
    static func hexValue(from hexString: String) -> UInt32 {
        
        var hexValue: UInt32 = 0
        Scanner(string: hexString).scanHexInt32(&hexValue)
        return hexValue
    }
    
    static func rgbComponents(for color: UIColor) -> [CGFloat] {
        
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return [red, green, blue]
    }
    
    static func cmykComponents(for color: UIColor) -> [CGFloat] {
        
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        let black = 1 - max(max(red, green), blue)
        let cyan =  (1 - red - black) / (1 - black)
        let magenta =  (1 - green - black) / (1 - black)
        let yellow =  (1 - blue - black) / (1 - black)
        
        return [cyan, magenta, yellow, black]
    }
    
    //MARK: Public Methods
    //MARK: RGB
    static func colorWithRGB(hexString: String, alpha: Float) -> UIColor {
        
        var hex = hexString
        
        UIColor.clean(&hex, expectedLength: 6)
        return UIColor.colorWithRGB(hexValue: UIColor.hexValue(from: hex), alpha: alpha);
    }
    
    static func colorWithRGB(hexValue: UInt32, alpha: Float) -> UIColor {
        return UIColor(red: CGFloat((hexValue & 0xFF0000) >> 16)/255.0, green: CGFloat((hexValue & 0xFF00) >> 8)/255.0, blue: CGFloat(hexValue & 0xFF)/255.0, alpha: CGFloat(alpha))
    }
    
    static func rgbHexString(for color: UIColor) -> String {
        
        let rgbComponents = UIColor.rgbComponents(for: color)
        var hexString = ""
        for component in rgbComponents {
            hexString.append(String(format: "%02x", arguments: [component * 255]))
        }
        
        return hexString
    }
    
    static func rgbHexValue(for color: UIColor) -> UInt {
        
        let rgbComponents = UIColor.rgbComponents(for: color)
        var hexValue: UInt = 0
        hexValue += UInt(rgbComponents[0] * 255) * 0xFFFFFF
        hexValue += UInt(rgbComponents[1] * 255) * 0xFFFF
        hexValue += UInt(rgbComponents[2] * 255) * 0xFF
        
        return hexValue
    }
    
    //MARK: CMYK
    convenience init(cyan: CGFloat, magenta: CGFloat, yellow: CGFloat, black: CGFloat, alpha: CGFloat) {
        
        let red = (1 - cyan) * (1 - black)
        let green = (1 - magenta) * (1 - black)
        let blue = (1 - yellow) * (1 - black)
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    static func colorWithCMYK(hexString: inout String, alpha: Float) -> UIColor {
        
        UIColor.clean(&hexString, expectedLength: 8)
        return UIColor.colorWithCMYK(hexValue: UIColor.hexValue(from: hexString), alpha: alpha);
    }
    
    static func colorWithCMYK(hexValue: UInt32, alpha: Float) -> UIColor {
        
        return UIColor(cyan: CGFloat((hexValue & 0xFF000000) >> 32)/255.0, magenta: CGFloat((hexValue & 0xFF0000) >> 16)/255.0, yellow: CGFloat((hexValue & 0xFF00) >> 8)/255.0, black: CGFloat(hexValue & 0xFF)/255.0, alpha: CGFloat(alpha))
    }
    
    static func cmykHexString(for color: UIColor) -> String {
        
        let cmykComponents = UIColor.cmykComponents(for: color)
        var hexString = ""
        for component in cmykComponents {
            hexString.append(String(format: "%02x", arguments: [component * 255]))
        }
        
        return hexString
    }
    
    static func cmykHexValue(for color: UIColor) -> UInt {
        
        let cmykComponents = UIColor.cmykComponents(for: color)
        var hexValue: UInt = 0
        hexValue += UInt(cmykComponents[0] * 255) & 0xFFFFFFFF
        hexValue += UInt(cmykComponents[1] * 255) & 0xFFFFFF
        hexValue += UInt(cmykComponents[2] * 255) & 0xFFFF
        hexValue += UInt(cmykComponents[2] * 255) & 0xFF
        
        return hexValue
    }
}
