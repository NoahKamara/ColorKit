//
//  HSL.swift
//
//
//  Created by Noah Kamara on 06.07.20.
//

import Foundation


/**
# HSL Representation of a Color
    - H: hue (0-360)
    - S: saturation (0-100)
    - L: lightness (0-100)
*/
public class HSL: CKColor {
    typealias COLOR = HSL
    
    public var description: String {
        get {
            return "(H: \(self.hue); S: \(self.saturation); L: \(self.lightness))"
        }
    }
    
    public static func == (lhs: HSL, rhs: HSL) -> Bool {
        let hue = lhs.hue == rhs.hue
        let sat = lhs.saturation == rhs.saturation
        let light = lhs.lightness == rhs.lightness
        return hue && sat && light
    }
    
    
    //MARK: Variables
    
    /// hue Value
    public private(set) var hue: Double
    
    /// saturation Value
    public private(set) var saturation: Double
    
    /// lightness Value
    public private(set) var lightness: Double
    
    
    //MARK: Initializers
    
    /// Initializer for RGB
    /// - Parameters:
    ///   - hue: hue value (0 - 360)
    ///   - saturation: saturation value  (0 - 100)
    ///   - lightness: lightness value  (0 - 100)
    init(hue: Double, saturation: Double, lightness: Double) {
        self.hue = min(max(hue, 0), 360)
        self.saturation = min(max(saturation, 0), 100)
        self.lightness = min(max(lightness, 0), 100)
    }
    
    /// Initializer for RGB
    /// - Parameters:
    ///   - hue: hue value (0 - 360)
    ///   - saturation: saturation value  (0 - 100)
    ///   - lightness: lightness value  (0 - 100)
    init(h: Double, s: Double, l: Double) {
        self.hue = min(max(h, 0), 360)
        self.saturation = min(max(s, 0), 100)
        self.lightness = min(max(l, 0), 100)
    }
    
    /// Initializer for RGB
    /// - Parameters:
    ///   - hue: hue value (0 - 360)
    ///   - saturation: saturation value  (0 - 100)
    ///   - lightness: lightness value  (0 - 100)
    init(_ hue: Double, _ saturation: Double, _ lightness: Double) {
        self.hue = min(max(hue, 0), 360)
        self.saturation = min(max(saturation, 0), 100)
        self.lightness = min(max(lightness, 0), 100)
    }
    
    /// Returns a random CKColor
    static func random() -> HSL {
        return HSL(
            hue: Double.random(in: 0...360),
            saturation: Double.random(in: 0...100),
            lightness: Double.random(in: 0...100)
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
    
    /// Sets the lightness value
    /// - Parameter value: value to be set
    public func setLightness(_ value: Double) {
        self.lightness = min(max(value, 0), 100)
    }
    
    
    //MARK: Representation Converters
    
    /// returns the Color's to RGB representation
    public func getRGB() -> RGB {
        let h = self.hue
        let s = self.saturation / 100
        let l = self.lightness / 100
        
        let c = (1 - abs( 2 * l - 1 ) ) * s
        let x = c * (1 - abs( (h / 60).truncatingRemainder(dividingBy: 2) - 1 ) )
        let m = l - c / 2
        
        var rgb: (Double, Double, Double) = (0,0,0)
        
        switch h {
            case 0..<60: rgb = (c,x,0)
            case 60..<120: rgb = (x,c,0)
            case 120..<180: rgb = (0,c,x)
            case 180..<240: rgb = (0,x,c)
            case 240..<300: rgb = (x,0,c)
            case 300..<360: rgb = (c,0,x)
            default: rgb = (0,0,0)
        }
        
        let r = (rgb.0 + m) * 255
        let g = (rgb.1 + m) * 255
        let b = (rgb.2 + m) * 255
        
        return RGB(red: Utility.roundTo(r, 3), green: Utility.roundTo(g, 3), blue: Utility.roundTo(b, 3))
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
