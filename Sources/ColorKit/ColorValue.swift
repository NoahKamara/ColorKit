//
//  File.swift
//  
//
//  Created by Noah Kamara on 09.07.20.
//

import Foundation

public struct ColorValue: Equatable, CustomStringConvertible {
    
    public var description: String {
        get {
            return self.color.description
        }
    }
    
    let color: RGB
    
    /// Initialize ColorValue from RGB
    /// - Parameter color: RGB representation of a color
    init(_ rgb: RGB) {
        self.color = rgb
    }
    
    /// Initialize ColorValue from HSV
    /// - Parameter color: HSV representation of a color
    init(_ hsv: HSV) {
        self.color = hsv.getRGB()
    }
    
    /// Initialize ColorValue from HSL
    /// - Parameter color: HSL representation of a color
    init(_ hsl: HSL) {
        self.color = hsl.getRGB()
    }
    
    /// Initialize ColorValue from CMYK
    /// - Parameter color: CMYK representation of a color
    init(_ cmyk: CMYK) {
        self.color = cmyk.getRGB()
    }
    
    /// returns the Color's to RGB representation
    func getRGB() -> RGB {
        return color.getRGB()
    }
    
    /// returns the Color's to HEX representation
    func getHEX() -> HEX {
        return color.getHEX()
    }
    
    /// returns the Color's to HSV representation
    func getHSV() -> HSV {
        return color.getHSV()
    }
    
    /// returns the Color's to HSL representation
    func getHSL() -> HSL {
        return color.getHSL()
    }
    
    /// returns the Color's to CMYK representation
    func getCMYK() -> CMYK {
        return color.getCMYK()
    }
}
