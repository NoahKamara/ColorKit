//
//  RGB.swift
//  
//
//  Created by Noah Kamara on 06.07.20.
//

import Foundation


/**
# RGB Representation of a Color
    - R: red (0-255)
    - G: green (0-255)
    - B: blue (0-255)
*/
public class RGB: CKColor {
    typealias COLOR = RGB
    
    public var description: String {
        get {
            return "(R: \(self.red); G: \(self.green); B: \(self.blue))"
        }
    }
    
    public static func == (lhs: RGB, rhs: RGB) -> Bool {
        let red = lhs.red == rhs.red
        let green = lhs.green == rhs.green
        let blue = lhs.blue == rhs.blue
        return red && green && blue
    }
    
    
    //MARK: Variables
    
    /// Red Value
    public private(set) var red: Double
    
    /// Green Value
    public private(set) var green: Double
    
    /// Blue Value
    public private(set) var blue: Double
    
    
    //MARK: Initializers
    
    /// Initializer for RGB
    /// - Parameters:
    ///   - red: red value
    ///   - green: green value
    ///   - blue: blue value
    init(red: Double, green: Double, blue: Double) {
        self.red = min(max(Utility.roundTo(red, 3), 0), 255)
        self.green = min(max(Utility.roundTo(green, 3), 0), 255)
        self.blue = min(max(Utility.roundTo(blue, 3), 0), 255)
    }
    
    /// Initializer for RGB
    /// - Parameters:
    ///   - red: red value
    ///   - green: green value
    ///   - blue: blue value
    init(_ red: Double, _ green: Double, _ blue: Double) {
        self.red = min(max(Utility.roundTo(red, 3), 0), 255)
        self.green = min(max(Utility.roundTo(green, 3), 0), 255)
        self.blue = min(max(Utility.roundTo(blue, 3), 0), 255)
    }
    
    /// Returns a random CKColor
    static func random() -> COLOR {
        return RGB(
            red: Double.random(in: 0...255),
            green: Double.random(in: 0...255),
            blue: Double.random(in: 0...255)
        )
    }
    
    
    //MARK: Setters
    
    /// Sets the red value
    /// - Parameter value: value to be set
    public func setRed(_ value: Double) {
        self.red = min(max(value, 0), 255)
    }
    
    /// Sets the green value
    /// - Parameter value: value to be set
    public func setGreen(_ value: Double) {
        self.green = min(max(value, 0), 255)
    }
    
    /// Sets the blue value
    /// - Parameter value: value to be set
    public func setBlue(_ value: Double) {
        self.blue = min(max(value, 0), 255)
    }
    
    
    //MARK: Representation Converters
    
    /// returns the Color's to RGB representation
    public func getRGB() -> RGB {
        return self
    }
    
    /// returns the Color's to HEX representation
    public func getHEX() -> HEX {
        let red = String(format:"%02X", Int(self.red))
        let green = String(format:"%02X", Int(self.green))
        let blue = String(format:"%02X", Int(self.blue))
        
        let hexString = red + green + blue
        return HEX(hexString)
    }
    
    /// returns the Color's to HSV representation
    public func getHSV() -> HSV {
        let r = self.red / 255
        let g = self.green / 255
        let b = self.blue / 255

        let cmax = [r, g, b].max()!
        let cmin = [r, g, b].min()!
        let diff = cmax-cmin
        
        var h: Double = 0.0
        var s: Double = 0.0
        var v: Double = 0.0
        
        if cmax == cmin {
            h = 0
        } else if cmax == r {
            h = (60 * ((g - b) / diff) + 360).truncatingRemainder(dividingBy: 360)
        } else if cmax == g {
            h = (60 * ((b - r) / diff) + 120).truncatingRemainder(dividingBy: 360)
        } else if cmax == b {
            h = (60 * ((r - g) / diff) + 240).truncatingRemainder(dividingBy: 360)
        }
        
        if cmax == 0 {
              s = 0
        } else {
            s = (diff / cmax) * 100
        }
        
        v = cmax * 100
    
        return HSV(h,s,v)
        
    }
    
    /// returns the Color's to HSL representation
    public func getHSL() -> HSL {
        let r = self.red / 255
        let g = self.green / 255
        let b = self.blue / 255
        
        let cmax = [r, g, b].max()!
        let cmin = [r, g, b].min()!
        let diff = cmax-cmin
        
        var h: Double = 0.0
        var s: Double = 0.0
        let l: Double = (cmax + cmin) / 2
        
        if cmax == cmin {
            s = 0
            h = 0
        } else {
            s = diff / (1 - abs(2 * l - 1));
            if cmax == r {
                h = (60 * ((g - b) / diff) + 360).truncatingRemainder(dividingBy: 360)
            } else if cmax == g {
                h = (60 * ((b - r) / diff) + 120).truncatingRemainder(dividingBy: 360)
            } else if cmax == b {
                h = (60 * ((r - g) / diff) + 240).truncatingRemainder(dividingBy: 360)
            }
        }
        
        return HSL(hue: h, saturation: s*100, lightness: l*100)
    }
    
    /// returns the Color's to CMYK representation
    public func getCMYK() -> CMYK {
        let r = self.red / 255
        let g = self.green / 255
        let b = self.blue / 255
        
        let max = [r,g,b].max()!
        let k = 1-max
        let c = (1-r-k) / (1-k)
        let m = (1-g-k) / (1-k)
        let y = (1-b-k) / (1-k)
        
        return CMYK(c: c*100, m: m*100, y: y*100, k: k*100)
    }
}
