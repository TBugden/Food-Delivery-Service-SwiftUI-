//
//  Food_Delivery_Service__SwiftUI_UITestsLaunchTests.swift
//  Food Delivery Service (SwiftUI)UITests
//
//  Created by Jesse Chan on 10/10/22.
//

import XCTest

final class Food_Delivery_Service__SwiftUI_UITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}