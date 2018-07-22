
import XCTest
import AppCenterXCUITestExtensions

class sampleapp_ios_swiftUITests: XCTestCase {
    var app: XCUIApplication!
    override func setUp() {
        super.setUp()
//        continueAfterFailure = false
        app = ACTLaunch.launch(XCUIApplication())
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_viewBuildPage_swipeLeftOneTime() {
        let window = app.windows.element(boundBy: 0)

        window.swipeLeft()

        XCTAssert(app.staticTexts["Build"].exists)
    }

    func test_viewTestPage_swipeLeftTwoTime() {
        let window = app.windows.element(boundBy: 0)
        
        window.swipeLeft()
        window.swipeLeft()

        XCTAssert(app.staticTexts["Test"].exists)
    }

    func test_viewDistributePage_swipeLeftThreeTime() {
        let window = app.windows.element(boundBy: 0)
        
        window.swipeLeft()
        window.swipeLeft()
        window.swipeLeft()

        XCTAssert(app.staticTexts["Distribute"].exists)
    }

    func test_viewCrashesPage_swipeLeftFourTime() {
        let window = app.windows.element(boundBy: 0)
        
        window.swipeLeft()
        window.swipeLeft()
        window.swipeLeft()
        window.swipeLeft()
        
        XCTAssert(app.staticTexts["Crashes"].exists)
    }

    func test_viewCrashAlert_whenTapButtonOnCrashPage() {
        let window = app.windows.element(boundBy: 0)
        
        window.swipeLeft()
        window.swipeLeft()
        window.swipeLeft()
        window.swipeLeft()
        
        let crasheButton = app.buttons["fatalErrorButton"]
        
        crasheButton.tap()
        
        let crashAlert = app.alerts["The app will close"]
        
        XCTAssert(crashAlert.exists)
    }
    
//    func test_crashApp_when() {
//        let window = app.windows.element(boundBy: 0)
//
//        window.swipeLeft()
//        window.swipeLeft()
//        window.swipeLeft()
//        window.swipeLeft()
//
//        let crasheButton = app.buttons["fatalErrorButton"]
//
//        crasheButton.tap()
//
//        let crashAlert = app.alerts["The app will close"]
//
//        crashAlert.buttons["Crash app"].tap()
//    }
//
    func testSwipeUntilCrashesPage() {
        // Assert that the crash button exists
        let window = app.windows.element(boundBy: 0)
        let fatalErrorButtonQuery = app.buttons.matching(identifier: "fatalErrorButton")
        XCTAssert(window.frame.contains(fatalErrorButtonQuery.accessibilityFrame))
    }
}
