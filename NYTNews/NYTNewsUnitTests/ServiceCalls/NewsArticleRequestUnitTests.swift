//
//  NewsArticleRequestUnitTests.swift
//  NYTNewsUnitTests
//
//  Created by Soriyany keo on 9/16/19.
//  Copyright © 2019 Soriyany keo. All rights reserved.
//

import XCTest
@testable import NYTNews
class NewsArticleRequestUnitTests: XCTestCase {
    var request:NewsArticleRequest?
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        request = NewsArticleRequest.from(search: "SearchKey")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        request = nil
        super.tearDown()
    }
    
    func testRequestHasParameters() {
        XCTAssertTrue((request?.parameters.count)! > 0, "There is No parameters.")
    }
    func testRequestHasAPIKey() {
        XCTAssertTrue((request?.parameters["api-key"])! == "d31fe793adf546658bd67e2b6a7fd11a" , "There is No API Key.")
    }
    func testRequestHasFilterKeys() {
        XCTAssertTrue((request?.parameters["fl"])! == "headline,multimedia,web_url" , "There is No Filter Key.")
    }
    func testRequestHasSearchKey() {
        XCTAssertTrue((request?.parameters["q"])! == "SearchKey" , "There is No Search Key.")
    }
    func testRequestPath(){
        XCTAssertTrue(request?.path == "articlesearch.json", "There is No path.")
    }
}
