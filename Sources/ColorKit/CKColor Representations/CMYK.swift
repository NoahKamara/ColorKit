//
//  CMYK.swift
//  
//
//  Created by Noah Kamara on 06.07.20.
//

import Foundation


/**
# CMYK Representation of a Color
    - C: cyan (0-360)
    - M: magenta (0-100)
    - Y: yellow (0-100)
    - K: key (0-100)
*/
public class CMYK: CKColor {
    typealias COLOR = CMYK
    
    public var description: String {
        get {
            return "(C: \(self.cyan); M: \(self.magenta); Y: \(self.yellow); K: \(self.key))"
        }
    }
    
    public static func == (lhs: CMYK, rhs: CMYK) -> Bool {
        let cyan = lhs.cyan == rhs.cyan
        let magenta = lhs.magenta == rhs.magenta
        let yellow = lhs.yellow == rhs.yellow
        let key = lhs.key == rhs.key
        return cyan && magenta && yellow && key
    }
    
    
    //MARK: Variables
    
    /// cyan Value
    public private(set) var cyan: Double
    
    /// magenta Value
    public private(set) var magenta: Double
    
    /// yellow Value
    public private(set) var yellow: Double
    
    /// key Value
    public private(set) var key: Double
    
    
    //MARK: Initializers
    
    /// Initializer for RGB
    /// - Parameters:
    ///   - cyan: cyan value (0 - 100)
    ///   - magenta: magenta value  (0 - 100)
    ///   - yellow: yellow value  (0 - 100)
    ///   - key: key value  (0 - 100)
    init(cyan: Double, magenta: Double, yellow: Double, key: Double) {
        self.cyan = min(max(cyan, 0), 100)
        self.magenta = min(max(magenta, 0), 100)
        self.yellow = min(max(yellow, 0), 100)
        self.key = min(max(key, 0), 100)
        
        self.cyan = self.cyan.isNaN ? 0 : self.cyan
        self.magenta = self.magenta.isNaN ? 0 : self.magenta
        self.yellow = self.yellow.isNaN ? 0 : self.yellow
        self.key = self.key.isNaN ? 0 : self.key
    }
    
    /// Initializer for RGB
    /// - Parameters:
    ///   - cyan: cyan value (0 - 100)
    ///   - magenta: magenta value  (0 - 100)
    ///   - yellow: yellow value  (0 - 100)
    ///   - key: key value  (0 - 100)
    init(c: Double, m: Double, y: Double, k: Double) {
        self.cyan = min(max(c, 0), 100)
        self.magenta = min(max(m, 0), 100)
        self.yellow = min(max(y, 0), 100)
        self.key = min(max(k, 0), 100)
        
        self.cyan = self.cyan.isNaN ? 0 : self.cyan
        self.magenta = self.magenta.isNaN ? 0 : self.magenta
        self.yellow = self.yellow.isNaN ? 0 : self.yellow
        self.key = self.key.isNaN ? 0 : self.key
    }
    
    /// Initializer for RGB
    /// - Parameters:
    ///   - cyan: cyan value (0 - 100)
    ///   - magenta: magenta value  (0 - 100)
    ///   - yellow: yellow value  (0 - 100)
    ///   - key: key value  (0 - 100)
    init(_ cyan: Double, _ magenta: Double, _ yellow: Double, _ key: Double) {
        self.cyan = min(max(cyan, 0), 100)
        self.magenta = min(max(magenta, 0), 100)
        self.yellow = min(max(yellow, 0), 100)
        self.key = min(max(key, 0), 100)
        
        self.cyan = self.cyan.isNaN ? 0 : self.cyan
        self.magenta = self.magenta.isNaN ? 0 : self.magenta
        self.yellow = self.yellow.isNaN ? 0 : self.yellow
        self.key = self.key.isNaN ? 0 : self.key
    }
    
    /// Returns a random RGB
    static func random() -> COLOR {
        return CMYK(
            cyan: Double.random(in: 0...100),
            magenta: Double.random(in: 0...100),
            yellow: Double.random(in: 0...100),
            key: Double.random(in: 0...100)
        )
    }
    
    
    //MARK: Setters
    
    /// Sets the cyan value
    /// - Parameter value: value to be set
    public func setCyan(_ value: Double) {
        self.cyan = min(max(value, 0), 100)
    }
    
    /// Sets the magenta value
    /// - Parameter value: value to be set
    public func setMagenty(_ value: Double) {
        self.magenta = min(max(value, 0), 100)
    }
    
    /// Sets the yellow value
    /// - Parameter value: value to be set
    public func setYellow(_ value: Double) {
        self.yellow = min(max(value, 0), 100)
    }
    
    /// Sets the key value
    /// - Parameter value: value to be set
    public func setKey(_ value: Double) {
        self.key = min(max(value, 0), 100)
    }
    
    
    //MARK: Representation Converters
    
    /// returns the Color's to RGB representation
    public func getRGB() -> RGB {
        let c = self.cyan / 100
        let m = self.magenta / 100
        let y = self.yellow / 100
        let k = self.key / 100
        let r = 255 * (1-c) * (1-k)
        let g = 255 * (1-m) * (1-k)
        let b = 255 * (1-y) * (1-k)
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
        return self
    }
}
