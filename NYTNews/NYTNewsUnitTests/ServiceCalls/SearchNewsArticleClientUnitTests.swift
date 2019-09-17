//
//  SearchNewsArticleClientUnitTests.swift
//  NYTNewsUnitTests
//
//  Created by Soriyany keo on 9/16/19.
//  Copyright © 2019 Soriyany keo. All rights reserved.
//

import XCTest
@testable import NYTNews
class SearchNewsArticleClientUnitTests: XCTestCase {
    var request:NewsArticleRequest?
    var searchClient:SearchNewsArticleClient?
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        request = NewsArticleRequest.from(search: "hello")
        searchClient = SearchNewsArticleClient()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        request = nil
        searchClient = nil
        super.tearDown()
    }
    
    func testSessionIsNotNil() {
        XCTAssertNotNil(searchClient?.session, "Session is Nil")
    }
    func testFetchNews(){
        searchClient?.fetchNews(with:request!, page: 2) { responseResult in
            switch responseResult{
            case .success(let response):
                XCTAssertNotNil(response, "There is no response data")
            case .failure(let error):
                XCTFail("Status code: \(error.reason)")
            }
        }
    }
    func testValidCallNewsGetsHTTPS(){
        let baseURL: URL = URL(string: "https://api.nytimes.com/svc/search/v2/")!
        
        guard let path = request?.path else {
            XCTFail("Error: No path")
            return
        }
        let urlRequest = URLRequest(url: baseURL.appendingPathComponent(path))
        
        guard let parametersData = request?.parameters else {
            XCTFail("Error: No parameters")
            return
        }
        let parameters = ["page": "\(1)"].merging(parametersData, uniquingKeysWith: +)
        let encodedURLRequest = urlRequest.encode(with: parameters)
        
        guard let session = searchClient?.session else {
            XCTFail("Error: No session")
            return
        }
        session.dataTask(with: encodedURLRequest, completionHandler: { data, response, error in
            guard
                let httpResponse = response as? HTTPURLResponse,
                httpResponse.hasSuccessStatusCode,
                let data = data
                else {
                    XCTFail("Error: \(ResponseResult<Any, DataResponseError>.failure(DataResponseError.network))")
                    return
            }
            guard let decodedResponse = try? JSONDecoder().decode(NewsArticleResponse.self, from: data) else {
                XCTFail("Error: \(ResponseResult<Any, DataResponseError>.failure(DataResponseError.decoding))")
                return
            }
            
            XCTAssertNotNil(decodedResponse, "There is no decodedResponse data")
            
        }).resume()
    }
}
