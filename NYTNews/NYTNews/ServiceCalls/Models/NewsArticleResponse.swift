//
//  PagedNewsResponse.swift
//  NYTNews
//
//  Created by Soriyany keo on 9/16/19.
//  Copyright © 2019 Soriyany keo. All rights reserved.
//

import Foundation
struct NewsArticleResponse:Decodable {
    let status:String
    let copyright:String
    let response:Response
}
