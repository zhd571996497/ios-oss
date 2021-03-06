@testable import Kickstarter_Framework
@testable import KsApi
import Library
import XCTest

internal final class HelpViewControllerTests: TestCase {
  override func setUp() {
    super.setUp()
    UIView.setAnimationsEnabled(false)
  }

  override func tearDown() {
    UIView.setAnimationsEnabled(true)
    super.tearDown()
  }

  func testHelpViewController() {
    Language.allLanguages.forEach { language in
      withEnvironment(
        apiService: MockService(),
        language: language
      ) {
        let vc = HelpViewController.instantiate()
        _ = traitControllers(device: .phone4_7inch, orientation: .portrait, child: vc)

        self.scheduler.run()

        FBSnapshotVerifyView(vc.view, identifier: "lang_\(language)")
      }
    }
  }
}
