//
//  File.swift
//  
//
//  Created by Noah Kamara on 06.07.20.
//

import Foundation

protocol CKColor: Equatable, CustomStringConvertible {
    associatedtype COLOR
    
    var description: String { get }
    /// returns the Color's to RGB representation
    func getRGB() -> RGB
    
    /// returns the Color's to HEX representation
    func getHEX() -> HEX
    
    /// returns the Color's to HSV representation
    func getHSV() -> HSV
    
    /// returns the Color's to HSL representation
    func getHSL() -> HSL
    
    /// returns the Color's to CMYK representation
    func getCMYK() -> CMYK
    
    /// returns a random color
    static func random() -> COLOR
}
