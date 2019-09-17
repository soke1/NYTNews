//
//  Doc.swift
//  NYTNews
//
//  Created by Soriyany keo on 9/16/19.
//  Copyright © 2019 Soriyany keo. All rights reserved.
//

import Foundation
struct Doc:Decodable {
    let headline:Headline
    let web_url:String
    let multimedia:[Multimedia]
}
