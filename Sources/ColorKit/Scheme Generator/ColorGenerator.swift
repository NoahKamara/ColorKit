//
//  ColorGenerator.swift
//
//
//  Created by Noah Kamara on 06.07.20.
//

import Foundation

/// Class for utility functions for color-scheme generation
public class ColorGenerator {
    /// Generates a complementary Color Scheme to the base color
    /// - Parameter base: base color
    /// - Returns: ColorScheme
    static func complementary(for base: ColorValue) -> ColorScheme {
        let h0 = base.getHSV().hue
        let h1 = abs((h0 + 180) - 360)
        let c1 = HSV(h: h1, s: base.getHSV().saturation, v: base.getHSV().value)
        return ColorScheme( [base, ColorValue(c1)] )
    }
    
    /// Generates a triadic Color Scheme to the base color
    /// - Parameter base: base color
    /// - Returns: ColorScheme
    static func triadic(for base: ColorValue) -> ColorScheme {
        let h0 = base.getHSV().hue
        let h1 = abs((h0 + 120) - 360)
        let h2 = abs((h0 + 240) - 360)
        let c1 = HSV(h: h1, s: base.getHSV().saturation, v: base.getHSV().value)
        let c2 = HSV(h: h2, s: base.getHSV().saturation, v: base.getHSV().value)
        return ColorScheme( [base, ColorValue(c1), ColorValue(c2)] )
    }
    
    /// Generates a triadic Color Scheme to the base color
    /// - Parameter base: base color
    /// - Returns: ColorScheme
    static func tetradic(for base: ColorValue) -> ColorScheme {
        let h0 = base.getHSV().hue
        let h1 = abs((h0 + 90) - 360)
        let h2 = abs((h0 + 180) - 360)
        let h3 = abs((h0 + 270) - 360)
        let c1 = HSV(h: h1, s: base.getHSV().saturation, v: base.getHSV().value)
        let c2 = HSV(h: h2, s: base.getHSV().saturation, v: base.getHSV().value)
        let c3 = HSV(h: h3, s: base.getHSV().saturation, v: base.getHSV().value)
        return ColorScheme( [base, ColorValue(c1), ColorValue(c2), ColorValue(c3)] )
    }
    
    /// Generates a triadic Color Scheme to the base color
    /// - Parameter base: base color
    /// - Returns: ColorScheme
    static func analogous(for base: ColorValue) -> ColorScheme {
        let h0 = base.getHSV().hue
        let h1 = abs((h0 + 30) - 360)
        let h2 = abs((h0 + 60) - 360)
        let h3 = abs((h0 + 90) - 360)
        let c1 = HSV(h: h1, s: base.getHSV().saturation, v: base.getHSV().value)
        let c2 = HSV(h: h2, s: base.getHSV().saturation, v: base.getHSV().value)
        let c3 = HSV(h: h3, s: base.getHSV().saturation, v: base.getHSV().value)
        return ColorScheme( [base, ColorValue(c1), ColorValue(c2), ColorValue(c3)] )
    }
}
