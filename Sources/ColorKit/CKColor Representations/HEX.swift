//
//  HEX.swift
//
//
//  Created by Noah Kamara on 06.07.20.
//

import Foundation


/**
# HEX Representation of a Color
    - value: hex-string (00 00 00 - FF FF FF)
*/
public class HEX: CKColor {
    typealias COLOR = HEX
    
    public var description: String {
        get {
            return "(#\(self.value))"
        }
    }
    
    public static func == (lhs: HEX, rhs: HEX) -> Bool {
        return lhs.value == rhs.value
    }
    
    
    //MARK: Variables
    
    /// hex value
    public private(set) var value: String
    
    
    //MARK: Initializers
    
    /// Initializer for HEX
    /// - Parameters:
    ///   - hex: hex value (000000 - FFFFFF)
    init(_ hex: String) /*throws*/ {
        /// Trim whitespaces
        let trimmed = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        
        /// make uppercase
        let upper = trimmed.uppercased()
        
        /// Validate chars in hex-string
        var valHex = ""
        for i in 0...upper.count-1 {
            var char = upper[i]
            if Int(char) == nil {
                let allowedChars = ["A","B","C","D","E","F"]
                char = allowedChars.contains(char) ? char : "F"
            }
            valHex += char
        }
        
        /// Validate number of chars in hex-string
        if valHex.count == 6 {
            self.value = valHex
        } else if valHex.count == 3 {
            self.value = valHex[0] + valHex[0] + valHex[1] + valHex[1] + valHex[2] + valHex[2]
        } else {
            // throw HEX.Errors.Invalid
            self.value = "000000"
        }
    }
    
    
    //MARK: Setters
    
    /// Sets the hue value
    /// - Parameter value: value to be set
    public func setHex(_ hex: String) /*throws*/ {
        /// Trim whitespaces
        let trimmed = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        
        /// make uppercase
        let upper = trimmed.uppercased()
        
        /// Validate chars in hex-string
        var valHex = ""
        for i in 0...upper.count {
            var char = upper[i]
            if Int(char) == nil {
                let allowedChars = ["A","B","C","D","E","F"]
                char = allowedChars.contains(char) ? char : "F"
            }
            valHex += char
        }
        
        /// Validate number of chars in hex-string
        if valHex.count == 6 {
            self.value = valHex
        } else if valHex.count == 3 {
            self.value = valHex[0] + valHex[0] + valHex[1] + valHex[1] + valHex[2] + valHex[2]
        } else {
            // throw HEX.Errors.Invalid
            self.value = "000000"
        }
    }
    
    /// Returns a random CKColor
    static func random() -> COLOR {
        var hexString = ""
        for _ in 0...6 {
            let randInt = Int.random(in: 0...16)
            if randInt < 10 {
                hexString += String(randInt)
            } else {
                let allowedChars = ["A","B","C","D","E","F"]
                hexString += allowedChars[randInt-10]
            }
        }
        return HEX(hexString)
    }
    
    
    //MARK: Representation Converters
    
    /// returns the Color's to RGB representation
    public func getRGB() -> RGB {
        var rgbValue:UInt64 = 0
        Scanner(string: self.value).scanHexInt64(&rgbValue)
        let red = Double((rgbValue & 0xFF0000) >> 16)
        let green = Double((rgbValue & 0x00FF00) >> 8)
        let blue = Double(rgbValue & 0x0000FF)
        return RGB(red: red, green: green, blue: blue)
    }
    
    /// returns the Color's to HEX representation
    public func getHEX() -> HEX {
        return self.getRGB().getHEX()
    }
    
    /// returns the Color's to HSV representation
    public func getHSV() -> HSV {
        return self.getRGB().getHSV()
    }
    
    /// returns the Color's to HSL representation
    public func getHSL() -> HSL {
        return self.getRGB().getHSL()
    }
    
    /// returns the Color's to CMYK representation
    public func getCMYK() -> CMYK {
        return self.getRGB().getCMYK()
    }
}


extension String {

    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}
