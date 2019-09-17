//
//  NewsRequest.swift
//  NYTNews
//
//  Created by Soriyany keo on 9/16/19.
//  Copyright © 2019 Soriyany keo. All rights reserved.
//

import Foundation
struct NewsArticleRequest {
    var path: String {
        return "articlesearch.json"
    }
    
    let parameters: Parameters
    private init(parameters:Parameters){
        self.parameters = parameters
    }
}
extension NewsArticleRequest{
    static func from(search:String) -> NewsArticleRequest{
        let defaultParameters = ["api-key":"d31fe793adf546658bd67e2b6a7fd11a","fl":"headline,multimedia,web_url"]
        let parameters = ["q": "\(search)"].merging(defaultParameters, uniquingKeysWith: +)
        return NewsArticleRequest(parameters: parameters)
    }
}
