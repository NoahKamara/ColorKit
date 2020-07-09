//
//  File.swift
//  
//
//  Created by Noah Kamara on 09.07.20.
//

import Foundation

public class Utility {
    public static func roundTo(_ value: Double, _ precision: Int) -> Double {
        let p: Double =  Double(10^precision)
        return Double(round(p*value)/p)
    }
}
