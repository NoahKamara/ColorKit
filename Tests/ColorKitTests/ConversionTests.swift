//
//  ConversionTests.swift
//  ColorKitTests
//
//  Created by Noah Kamara on 09.07.20.
//

import XCTest
@testable import ColorKit

class ConversionTests: XCTestCase {

    private let colors_rgb: [RGB] = [
        RGB(0,0,0),
        RGB(255,255,255),
        RGB(255,0,0),
        RGB(0,255,0),
        RGB(0,0,255),
        RGB(255,255,0),
        RGB(255,0,255),
        RGB(0,255,255),
        RGB(132,48,1),
        RGB(140,9,142)
    ]
    
    private let colors_hex: [HEX] = [
        HEX("000000"),
        HEX("FFFFFF"),
        HEX("FF0000"),
        HEX("00FF00"),
        HEX("0000FF"),
        HEX("FFFF00"),
        HEX("FF00FF"),
        HEX("00FFFF"),
        HEX("843001"),
        HEX("8C098E")
    ]
    
    private let colors_hsv: [HSV] = [
        HSV(h: 0.0, s: 0.0, v: 0.0),
        HSV(h: 0.0, s: 0.0, v: 100.0),
        HSV(h: 0.0, s: 100.0, v: 100.0),
        HSV(h: 120.0, s: 100.0, v: 100.0),
        HSV(h: 240.0, s: 100.0, v: 100.0),
        HSV(h: 60.0, s: 100.0, v: 100.0),
        HSV(h: 300.0, s: 100.0, v: 100.0),
        HSV(h: 180.0, s: 100.0, v: 100.0),
        HSV(h: 21.526717557251914, s: 99.24242424242425, v: 51.76470588235295),
        HSV(h: 299.09774436090225, s: 93.66197183098592, v: 55.68627450980392)
    ]
    
    private let colors_hsl: [HSL] = [
        HSL(h: 0.0, s: 0.0, l: 0.0),
        HSL(h: 0.0, s: 0.0, l: 100.0),
        HSL(h: 0.0, s: 100.0, l: 50.0),
        HSL(h: 120.0, s: 100.0, l: 50.0),
        HSL(h: 240.0, s: 100.0, l: 50.0),
        HSL(h: 60.0, s: 100.0, l: 50.0),
        HSL(h: 300.0, s: 100.0, l: 50.0),
        HSL(h: 180.0, s: 100.0, l: 50.0),
        HSL(h: 21.526717557251914, s: 98.49624060150376, l: 26.078431372549023),
        HSL(h: 299.09774436090225, s: 88.07947019867551, l: 29.607843137254903)
    ]
    
    private let colors_cmyk: [CMYK] = [
        CMYK(c: 0.0, m: 0.0, y: 0.0, k: 100.0),
        CMYK(c: 0.0, m: 0.0, y: 0.0, k: 0.0),
        CMYK(c: 0.0, m: 100.0, y: 100.0, k: 0.0),
        CMYK(c: 100.0, m: 0.0, y: 100.0, k: 0.0),
        CMYK(c: 100.0, m: 100.0, y: 0.0, k: 0.0),
        CMYK(c: 0.0, m: 0.0, y: 100.0, k: 0.0),
        CMYK(c: 0.0, m: 100.0, y: 0.0, k: 0.0),
        CMYK(c: 100.0, m: 0.0, y: 0.0, k: 0.0),
        CMYK(c: 0.0, m: 63.63636363636363, y: 99.24242424242425, k: 48.23529411764705),
        CMYK(c: 1.4084507042253471, m: 93.66197183098592, y: 0.0, k: 44.31372549019608)
    ]

    
    /// Testing the Conversion of RGB to HEX
    func testRGBtoHEX() {
        let colors = self.colors_rgb
        let solutions = self.colors_hex
        var failures = 0
        for i in colors.indices {
            failures += (colors[i].getHEX() == solutions[i]) ? 0 : 1
        }
        XCTAssert(failures == 0, "RGB -> HEX  errs: \(failures)")
    }
    
    /// Testing the Conversion of RGB to HSV
    func testRGBtoHSV() {
        let colors = self.colors_rgb
        let solutions = self.colors_hsv
        var failures = 0
        for i in colors.indices {
            failures += (colors[i].getHSV() == solutions[i]) ? 0 : 1
        }
        XCTAssert(failures == 0, "RGB -> HSV  errs: \(failures)")
    }
    
    /// Testing the Conversion of RGB to HSL
    func testRGBtoHSL() {
        let colors = self.colors_rgb
        let solutions = self.colors_hsl
        var failures = 0
        for i in colors.indices {
            failures += (colors[i].getHSL() == solutions[i]) ? 0 : 1
        }
        XCTAssert(failures == 0, "RGB -> HSL  errs: \(failures)")
    }
    
    /// Testing the Conversion of RGB to CMYK
    func testRGBtoCMYK() {
        let colors = self.colors_rgb
        let solutions = self.colors_cmyk
        var failures = 0
        for i in colors.indices {
            failures += (colors[i].getCMYK() == solutions[i]) ? 0 : 1
        }
        XCTAssert(failures == 0, "RGB -> CMYK  errs: \(failures)")
    }
    
    
    //MARK: Reverse
    
    // print("CMYK(c: \(con.cyan), m: \(con.magenta), y: \(con.yellow), k: \(con.key)),")
    
    
    /// Testing the Conversion of HEX to RGB
    func testHEXtoRGB() {
        let colors = self.colors_hex
        let solutions = self.colors_rgb
        var failures = 0
        for i in colors.indices {
            failures += (colors[i].getRGB() == solutions[i]) ? 0 : 1
        }
        XCTAssert(failures == 0, "HEX -> RGB  errs: \(failures)")
    }
    
    /// Testing the Conversion of HSV to RGB
    func testHSVtoRGB() {
        let colors = self.colors_hsv
        let solutions = self.colors_rgb
        var failures = 0
        for i in colors.indices {
            failures += (colors[i].getRGB() == solutions[i]) ? 0 : 1
            if colors[i].getRGB() != solutions[i] {
                print(colors[i].getCMYK(), solutions[i])
            }
        }
        XCTAssert(failures == 0, "HSV -> RGB  errs: \(failures)")
    }
    
    /// Testing the Conversion of HSL to RGB
    func testHSLtoRGB() {
        let colors = self.colors_hsl
        let solutions = self.colors_rgb
        var failures = 0
        for i in colors.indices {
            failures += (colors[i].getRGB() == solutions[i]) ? 0 : 1
        }
        XCTAssert(failures == 0, "HSL -> RGB  errs: \(failures)")
    }
    
    /// Testing the Conversion of CMYK to RGB
    func testCMYKtoRGB() {
        let colors = self.colors_cmyk
        let solutions = self.colors_rgb
        var failures = 0
        for i in colors.indices {
            failures += (colors[i].getRGB() == solutions[i]) ? 0 : 1
            if colors[i].getRGB() != solutions[i] {
                print(colors[i].getRGB(), solutions[i])
            }
        }
        XCTAssert(failures == 0, "CMYK -> RGB  errs: \(failures)")
    }

//    static var allTests = [
//        ("RGB to HEX Conversion", testRGBtoHEX),
//        ("RGB to HSV Conversion", testRGBtoHSV),
//        ("RGB to HSL Conversion", testRGBtoHSL),
//        ("RGB to CMYK Conversion", testRGBtoCMYK),
//        
//        ("HEX to RGB Conversion", testHEXtoRGB),
//        ("HSV to RGB Conversion", testHSVtoRGB),
//        ("HSL to RGB Conversion", testHSLtoRGB),
//        ("CMYK to RGB Conversion", testCMYKtoRGB)
//    ]
}
