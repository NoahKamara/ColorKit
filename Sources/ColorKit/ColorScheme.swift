//
//  ColorScheme.swift
//
//
//  Created by Noah Kamara on 06.07.20.
//

import Foundation


/// Color Scheme
public class ColorScheme: Equatable, CustomStringConvertible {
    
    public static func == (lhs: ColorScheme, rhs: ColorScheme) -> Bool {
        if lhs.colors.count != rhs.colors.count {
            return false
        }
        for i in lhs.colors.indices {
            if lhs.colors[i] != rhs.colors[i] {
                return false
            }
        }
        return true
    }
    
    public var description: String {
        get {
            var line = ""
            for color in self.colors {
                line += color.description
                if color != self.colors.last! {
                    line += "; "
                }
            }
            return line
        }
    }
    
    public private(set) var colors: [ColorValue]
    /// Initializes an instance of ColorScheme
    /// - Parameter colors: a list of CKColors
    init(_ colors: [ColorValue]) {
        self.colors = colors
    }
    
    /// Returns the colors of the scheme in RGB representation
    /// - Returns: List of colors in RGB representation
    public func getRGB() -> [RGB] {
        return colors.map({ $0.getRGB() })
    }
    
    /// Returns the colors of the scheme in HEX representation
    /// - Returns: List of colors in HEX representation
    public func getHEX() -> [HEX] {
        return colors.map({ $0.getHEX() })
    }
    
    /// Returns the colors of the scheme in HSV representation
    /// - Returns: List of colors in HSV representation
    public func getHSV() -> [HSV] {
        return colors.map({ $0.getHSV() })
    }
    
    /// Returns the colors of the scheme in HSL representation
    /// - Returns: List of colors in HSL representation
    public func getHSL() -> [HSL] {
        return colors.map({ $0.getHSL() })
    }
}
