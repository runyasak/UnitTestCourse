//
//  FizzBuzzTests.swift
//  FizzBuzzTests
//
//  Created by Runyasak Chaengnaimuang on 13/2/2564 BE.
//

import XCTest
@testable import UnitTestCourse

class FizzBuzzTests: XCTestCase {
    
    var fizzBuzz: FizzBuzz!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        fizzBuzz = FizzBuzz()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        fizzBuzz = nil
    }

    func testFizzBuzz_WhenNumberIs15_ShouldReturnFizzBuzz() throws {
        let actual = fizzBuzz.say(number: 15)
        
        XCTAssertEqual(actual, "fizzbuzz")
    }
    
    func testFizzBuzz_WhenNumberIs10_ShouldReturnBuzz() throws {
        let actual = fizzBuzz.say(number: 10)
        
        XCTAssertEqual(actual, "buzz")
    }
    
    func testFizzBuzz_WhenNumberIs30_ShouldReturnFizzBuzz() throws {
        let actual = fizzBuzz.say(number: 30)
        
        XCTAssertEqual(actual, "fizzbuzz")
    }


}
