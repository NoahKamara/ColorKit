//
//  HSV.swift
//  
//
//  Created by Noah Kamara on 06.07.20.
//

import Foundation


/**
# HSV Representation of a Color
    - H: hue (0-360)
    - S: saturation (0-100)
    - V: value (brightness) (0-100)
*/
public class HSV: CKColor {
    
    typealias COLOR = HSV
    
    public var description: String {
        get {
            return "(H: \(self.hue); S: \(self.saturation); V: \(self.value))"
        }
    }
    
    public static func == (lhs: HSV, rhs: HSV) -> Bool {
        let hue = lhs.hue == rhs.hue
        let sat = lhs.saturation == rhs.saturation
        let val = lhs.value == rhs.value
        return hue && sat && val
    }
    
    
    //MARK: Variables
    
    /// hue Value
    public private(set) var hue: Double
    
    /// saturation Value
    public private(set) var saturation: Double
    
    /// value Value
    public private(set) var value: Double
    
    
    //MARK: Initializers
    
    /// Initializer for RGB
    /// - Parameters:
    ///   - hue: hue value (0 - 360)
    ///   - saturation: saturation value  (0 - 100)
    ///   - value: value (brightness)  (0 - 100)
    init(hue: Double, saturation: Double, value: Double) {
        self.hue = min(max(hue, 0.0), 360.0)
        self.saturation = min(max(saturation, 0), 100)
        self.value = min(max(value, 0), 100)
    }
    
    /// Initializer for RGB
    /// - Parameters:
    ///   - hue: hue value (0 - 360)
    ///   - saturation: saturation value  (0 - 100)
    ///   - value: value (brightness)  (0 - 100)
    init(h: Double, s: Double, v: Double) {
        self.hue = min(max(h, 0), 360)
        self.saturation = min(max(s, 0), 100)
        self.value = min(max(v, 0), 100)
    }
    
    /// Initializer for RGB
    /// - Parameters:
    ///   - hue: hue value (0 - 360)
    ///   - saturation: saturation value  (0 - 100)
    ///   - value: value (brightness)  (0 - 100)
    init(_ hue: Double, _ saturation: Double, _ value: Double) {
        self.hue = min(max(hue, 0), 360)
        self.saturation = min(max(saturation, 0), 100)
        self.value = min(max(value, 0), 100)
    }
    
    /// Returns a random CKColor
    static func random() -> HSV {
        return HSV(
            hue: Double.random(in: 0...360),
            saturation: Double.random(in: 0...100),
            value: Double.random(in: 0...100)
        )
    }
    
    
    //MARK: Setters
    
    /// Sets the hue value
    /// - Parameter value: value to be set
    public func setHue(_ value: Double) {
        self.hue = min(max(value, 0), 360)
    }
    
    /// Sets the saturation value
    /// - Parameter value: value to be set
    public func setSaturation(_ value: Double) {
        self.saturation = min(max(value, 0), 100)
    }
    
    /// Sets the value value
    /// - Parameter value: value to be set
    public func setvalue(_ value: Double) {
        self.value = min(max(value, 0), 100)
    }
    
    
    //MARK: Representation Converters
    
    /// returns the Color's to RGB representation
    public func getRGB() -> RGB {
        let h = self.hue
        let s = self.saturation / 100
        let v = self.value / 100
        
        let interval = floor(h / 60)
        let f = (h / 60) - interval
        
        let p = v * (1 - s)
        let q = v * (1 - s * f)
        let t = v * (1 - s * (1 - f))
        
        var rgb: (Double, Double, Double) = (0,0,0)
        
        switch interval {
            case 0: rgb = (v, t, p)
            case 6: rgb = (v, t, p)
            case 1: rgb = (q, v, p)
            case 2: rgb = (p, v, t)
            case 3: rgb = (p, q, v)
            case 4: rgb = (t, p, v)
            case 5: rgb = (v, p, q)
            default: rgb = (1, 1, 1)
        }
        
        let r = rgb.0 * 255
        let g = rgb.1 * 255
        let b = rgb.2 * 255
        
        return RGB(r, g, b)
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
