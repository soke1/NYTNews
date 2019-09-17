//
//  Response.swift
//  NYTNews
//
//  Created by Soriyany keo on 9/16/19.
//  Copyright © 2019 Soriyany keo. All rights reserved.
//

import Foundation
struct Response:Decodable {
    let docs:[Doc]
    let meta:Meta
}
