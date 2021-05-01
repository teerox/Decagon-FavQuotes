//
//  HomeViewModelTest.swift
//  FavQuotesTests
//
//  Created by Anthony Odu on 29/04/2021.
//

import XCTest
@testable import FavQuotes

class HomeViewModelTests: XCTestCase {
    var viewModel: HomeViewModel?
    override func setUp() {
        super.setUp()
        viewModel = HomeViewModel()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    func testAllCategoryHasTopic() {
        XCTAssertTrue(!(viewModel?.allCategories!.isEmpty)!)
    }
}
