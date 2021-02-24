//
//  SIgnupPresenterTests.swift
//  UnitTestCourseTests
//
//  Created by Runyasak Chaengnaimuang on 13/2/2564 BE.
//

import XCTest
@testable import UnitTestCourse

class SIgnupPresenterTests: XCTestCase {
    
    var presenter: Presenter!
    var fakeSerivce: FakeSuccessfullySignupService!
    var fakeFailService: FakeFailSignupService!

    override func setUpWithError() throws {
        fakeSerivce = FakeSuccessfullySignupService()
        fakeFailService = FakeFailSignupService()
        presenter = Presenter(service: fakeSerivce)

    }

    override func tearDownWithError() throws {
        fakeFailService = nil
        fakeSerivce = nil
        presenter = nil
    }

    func testSignup_ShouldCallSignupService() throws {
        let firstname = "World"
        let lastname = "ODDS"
        let email = "world@odds.team"
        let password = "123123"
        
        presenter.signup(firstname: firstname, lastname: lastname, email: email, password: password)
        
        XCTAssertTrue(fakeSerivce.hasCalled)
    }
    
    func testSignup_ShouldNotCallSignupService() throws {
        let firstname = ""
        let lastname = "ODDS"
        let email = "world@odds.team"
        let password = "123123"
        
        presenter.signup(firstname: firstname, lastname: lastname, email: email, password: password)
        
        XCTAssertFalse(fakeSerivce.hasCalled)
    }

    func testSignup_WhenSignupSuccessfully_ShouldReturnSuccessful() throws {
        let firstname = "World"
        let lastname = "ODDS"
        let email = "world@odds.team"
        let password = "123123"
        
        presenter.signup(
            firstname: firstname,
            lastname: lastname,
            email: email,
            password: password
        ) { status in XCTAssertEqual(status, "Successful")}
    }
    
    func testSignup_WhenSignupFail_ShouldReturnFail() throws {
        let firstname = "World"
        let lastname = "ODDS"
        let email = "world@odds.team"
        let password = "123123"
        
        presenter = Presenter(service: fakeFailService)
        
        presenter.signup(
            firstname: firstname,
            lastname: lastname,
            email: email,
            password: password
        ) { status in XCTAssertEqual(status, "Fail")}
    }
}

class FakeSuccessfullySignupService: SignupServiceProtocol {
    var hasCalled = false

    func signup(
        firstname: String,
        lastname: String,
        email: String,
        password: String,
        completion: (Response) -> Void
    ) {
        hasCalled = true

        let response = Response(status: "Successful")
        completion(response)
    }
}

class FakeFailSignupService: SignupServiceProtocol {
    var hasCalled = false

    func signup(
        firstname: String,
        lastname: String,
        email: String,
        password: String,
        completion: (Response) -> Void
    ) {
        hasCalled = true

        let response = Response(status: "Fail")
        completion(response)
    }
}

