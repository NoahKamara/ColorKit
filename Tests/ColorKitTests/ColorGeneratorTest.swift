//
//  ColorGeneratorTest.swift
//  ColorKitTests
//
//  Created by Noah Kamara on 09.07.20.
//

import XCTest
@testable import ColorKit

class ColorGeneratorTest: XCTestCase {
    
    private let cg = ColorGenerator.self

    private let colors: [ColorValue] = [
        ColorValue(RGB(0,0,0)),
        ColorValue(RGB(255,255,255)),
        ColorValue(RGB(255,0,0)),
        ColorValue(RGB(0,255,0)),
        ColorValue(RGB(0,0,255)),
        ColorValue(RGB(255,255,0)),
        ColorValue(RGB(255,0,255)),
        ColorValue(RGB(0,255,255)),
        ColorValue(RGB(132,48,1)),
        ColorValue(RGB(140,9,142))
    ]
    
    private let solutions: [[ColorValue]] = [
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        []
    ]
    
    /// Testing the Generation of Complementary Colors
    func testComplementary() {
        var failures = 0
        for i in self.colors.indices {
            let cs = cg.complementary(for: self.colors[i])
            if cs.colors != self.solutions[i] {
                print(cs, self.solutions[i])
            }
//            failures += (colors[i].getHEX() == solutions[i]) ? 0 : 1
        }
        XCTAssert(failures == 0, "RGB -> HEX  errs: \(failures)")
    }

}
