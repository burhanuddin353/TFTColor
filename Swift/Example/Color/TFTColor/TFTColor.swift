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
    fileprivate static func clean(_ hexString: inout String, expectedLength: Int) {
        
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
    
    fileprivate static func hexValue(from hexString: String) -> UInt64 {
        
        var hexValue: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&hexValue)
        return hexValue
    }
    
    fileprivate var rgbComponents: [CGFloat] {
        
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return [red, green, blue]
    }
    
    fileprivate var cmykComponents: [CGFloat] {
        
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
        
        var rgbHexString = rgbHexString
        UIColor.clean(&rgbHexString, expectedLength: 6)
        self.init(rgbHexValue: UIColor.hexValue(from: rgbHexString), alpha: alpha)
    }
    
    convenience init(rgbHexValue: UInt64, alpha: Float) {
        self.init(red: CGFloat((rgbHexValue & 0xFF0000) >> 16)/255.0,
                  green: CGFloat((rgbHexValue & 0xFF00) >> 8)/255.0,
                  blue: CGFloat(rgbHexValue & 0xFF)/255.0,
                  alpha: CGFloat(alpha))
    }
    
    var rgbHexString: String {
        
        var hexString = ""
        for component in rgbComponents {
            hexString.append(String(format: "%02x", arguments: [UInt(component * 255)]))
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
    
    var red: UInt {
        return UInt(rgbComponents[0] * 255.0)
    }
    
    var green: UInt {
        return UInt(rgbComponents[1] * 255.0)
    }
    
    var blue: UInt {
        return UInt(rgbComponents[2] * 255.0)
    }
    
    //MARK: CMYK
    convenience init(cyan: Float, magenta: Float, yellow: Float, black: Float, alpha: Float) {
        
        let red = (1 - cyan) * (1 - black)
        let green = (1 - magenta) * (1 - black)
        let blue = (1 - yellow) * (1 - black)
        self.init(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha))
    }
    
    convenience init(cmykHexString: String, alpha: Float) {
        
        var cmykHexString = cmykHexString
        UIColor.clean(&cmykHexString, expectedLength: 8)
        self.init(cmykHexValue: UIColor.hexValue(from: cmykHexString), alpha: alpha);
    }
    
    convenience init(cmykHexValue: UInt64, alpha: Float) {
        
        self.init(cyan: Float((cmykHexValue & 0xFF000000) >> 24)/255.0,
                  magenta: Float((cmykHexValue & 0xFF0000) >> 16)/255.0,
                  yellow: Float((cmykHexValue & 0xFF00) >> 8)/255.0,
                  black: Float(cmykHexValue & 0xFF)/255.0,
                  alpha: Float(alpha))
    }
    
    var cmykHexString: String {
        
        var hexString = ""
        for component in cmykComponents {
            hexString.append(String(format: "%02x", arguments: [UInt(component * 255)]))
        }
        return hexString
    }
    
    var cmykHexValue: UInt64 {
        
        let cmykValues = cmykComponents
        var hexValue: UInt64 = 0
        hexValue |= UInt64(cmykValues[0] * 255) << 24
        hexValue |= UInt64(cmykValues[1] * 255) << 16
        hexValue |= UInt64(cmykValues[2] * 255) << 8
        hexValue |= UInt64(cmykValues[3] * 255)
        
        return hexValue
    }
    
    var cyan: UInt {
        return UInt(cmykComponents[0] * 255.0)
    }
    
    var magenta: UInt {
        return UInt(cmykComponents[1] * 255.0)
    }
    
    var yellow: UInt {
        return UInt(cmykComponents[2] * 255.0)
    }
    
    var black: UInt {
        return UInt(cmykComponents[3] * 255.0)
    }
}
