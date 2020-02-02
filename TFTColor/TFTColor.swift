//
//  TFTColor.swift
//  Swift Example
//
//  Created by Burhanuddin Sunelwala on 12/9/15.
//  Copyright © 2015 Burhanuddin Sunelwala. All rights reserved.
//

import UIKit

public extension UIColor {
    
    //MARK: Private Helper Methods
    private static func clean(_ hexString: inout String, expectedLength: Int) {
        
        hexString = hexString.trimmingCharacters(in: CharacterSet(charactersIn: "#"))
        hexString = hexString.replacingOccurrences(of: "0x", with: "")
        hexString = hexString.replacingOccurrences(of: "0X", with: "")
        
        //Check for Special Characters. Truncate the string from first special character.
        let characterSet = CharacterSet(charactersIn: "abcdefABCDEF1234567890").inverted
        if let firstInvalidCharPosition = hexString.rangeOfCharacter(from: characterSet)?.lowerBound {
            hexString.removeSubrange(firstInvalidCharPosition..<hexString.endIndex)
        }
        
        //Repeat the characters if they are half of expected length. 
        //Example(RGB): 353 -> 335533
        if hexString.count == expectedLength/2 {
            
            for (i, char) in hexString.enumerated() {

                let index = hexString.index(hexString.startIndex, offsetBy: i*2)
                hexString.insert(char, at: index)
            }
        }
        //Append leading zeros if the length is less than the expected length
        //Example(RGB): 5C -> 00005C
        else if hexString.count < expectedLength {
            while hexString.count != expectedLength {
                hexString.insert("0", at: hexString.startIndex)
            }
        }
        //Truncate the excess string if length is greater than expected length
        //Example(RGB): FFDF00321 -> FFDF00
        else if hexString.count > expectedLength {
            hexString.removeSubrange(hexString.index(hexString.startIndex, offsetBy: expectedLength)..<hexString.endIndex)
        }
    }
    
    private static func hexValue(from hexString: String) -> UInt64 {
        
        var hexValue: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&hexValue)
        return hexValue
    }
    
    private var rgbComponents: [CGFloat] {
        
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        red = min(1, red)
        green = min(1, green)
        blue = min(1, blue)
        
        return [red, green, blue]
    }
    
    private var cmykComponents: [CGFloat] {
        
        let red = rgbComponents[0]
        let green = rgbComponents[1]
        let blue = rgbComponents[2]
        
        let black = 1 - max(max(red, green), blue)
        if black == 1 { return [0, 0, 0, 1] }
        
        let cyan =  (1 - red - black) / (1 - black)
        let magenta =  (1 - green - black) / (1 - black)
        let yellow =  (1 - blue - black) / (1 - black)
        
        return [cyan, magenta, yellow, black]
    }
    
    //MARK: Public Methods
    //MARK: RGB
    convenience init(rgbHexString: String, alpha: Float = 1.0) {
        
        var rgbHex = rgbHexString
        UIColor.clean(&rgbHex, expectedLength: 6)
        self.init(rgbHexValue: UIColor.hexValue(from: rgbHex), alpha: alpha)
    }
    
    convenience init(rgbHexValue: UInt64, alpha: Float = 1.0) {

        self.init(red: CGFloat((rgbHexValue & 0xFF0000) >> 16)/255,
                  green: CGFloat((rgbHexValue & 0xFF00) >> 8)/255,
                  blue: CGFloat(rgbHexValue & 0xFF)/255,
                  alpha: CGFloat(alpha))
    }
    
    var rgbHexString: String {
        rgbComponents.map({ String(format: "%02x", arguments: [UInt($0 * 255)]) }).joined()
    }
    
    var rgbHexValue: UInt {
        
        let rgbValues = rgbComponents
        var hexValue: UInt = 0
        hexValue |= (UInt(rgbValues[0] * 255) << 16)
        hexValue |= (UInt(rgbValues[1] * 255) << 8)
        hexValue |= UInt(rgbValues[2] * 255)
        
        return hexValue
    }
    
    var redValue: UInt { UInt(rgbComponents[0] * 255) }
    var greenValue: UInt { UInt(rgbComponents[1] * 255) }
    var blueValue: UInt { UInt(rgbComponents[2] * 255) }
    
    //MARK: CMYK
    convenience init(cyan: Float, magenta: Float, yellow: Float, black: Float, alpha: Float) {
        
        let red = (1 - cyan) * (1 - black)
        let green = (1 - magenta) * (1 - black)
        let blue = (1 - yellow) * (1 - black)
        self.init(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha))
    }
    
    convenience init(cmykHexString: String, alpha: Float = 1.0) {

        var cmykHex = cmykHexString
        UIColor.clean(&cmykHex, expectedLength: 8)
        self.init(cmykHexValue: UIColor.hexValue(from: cmykHex), alpha: alpha);
    }
    
    convenience init(cmykHexValue: UInt64, alpha: Float = 1.0) {
        
        self.init(cyan: Float((cmykHexValue & 0xFF000000) >> 24)/255,
                  magenta: Float((cmykHexValue & 0xFF0000) >> 16)/255,
                  yellow: Float((cmykHexValue & 0xFF00) >> 8)/255,
                  black: Float(cmykHexValue & 0xFF)/255,
                  alpha: alpha)
    }
    
    var cmykHexString: String {
        cmykComponents.map({ String(format: "%02x", arguments: [UInt($0 * 255)]) }).joined()
    }
    
    var cmykHexValue: UInt64 {
        
        let cmykValues = cmykComponents
        var hexValue: UInt64 = 0
        hexValue |= UInt64(cmykValues[0] * 255) << 24
        hexValue |= UInt64(cmykValues[1] * 255) << 16
        hexValue |= UInt64(cmykValues[2] * 255) << 8
        hexValue |= UInt64(cmykValues[2] * 255)
        
        return hexValue
    }
    
    var cyanValue: UInt { UInt(cmykComponents[0] * 255) }
    var magentaValue: UInt { UInt(cmykComponents[1] * 255) }
    var yellowValue: UInt { UInt(cmykComponents[2] * 255) }
    var blackValue: UInt { UInt(cmykComponents[3] * 255) }
    
    //MARK: Utility
    var complementary: UIColor {
        
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0

        getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha);
        print(hue, saturation, brightness, alpha)
        return UIColor(hue: 1-hue, saturation: 1-saturation, brightness: 1-brightness, alpha: alpha)
    }
}
