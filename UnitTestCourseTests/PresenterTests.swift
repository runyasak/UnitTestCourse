//
//  PresenterTests.swift
//  UnitTestCourseUITests
//
//  Created by Runyasak Chaengnaimuang on 13/2/2564 BE.
//

import XCTest
@testable import UnitTestCourse

class PresenterTests: XCTestCase {
    
    var presenter: Presenter!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        presenter = Presenter(service: FakeSuccessfullySignupService())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        presenter = nil
    }

    func testIsValidFirstname_WhenFirstnameIsWorld_ShouldReturnTrue() throws {
        let actual = presenter.isValid(firstname: "World")

        XCTAssertTrue(actual)
    }
    
    func testIsValidFirstname_WhenFirstnameIsEmpty_ShouldReturnFalse() throws {
        let actual = presenter.isValid(firstname: "")

        XCTAssertFalse(actual)
    }
    
    func testIsValidFirstname_WhenPasswordsAreTheSame_ShouldReturnTrue() throws {
        let actual = presenter.isValid(password: "hello", secondPassword: "hello")

        XCTAssertTrue(actual)
    }
    
    func testIsValidFirstname_WhenPasswordsAreTheSame_ShouldReturnFalse() throws {
        let actual = presenter.isValid(password: "", secondPassword: "hello")

        XCTAssertFalse(actual)
    }

}
