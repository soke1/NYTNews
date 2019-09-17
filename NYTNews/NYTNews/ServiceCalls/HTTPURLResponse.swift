//
//  HTTPURLResponse.swift
//  NYTNews
//
//  Created by Soriyany keo on 9/16/19.
//  Copyright © 2019 Soriyany keo. All rights reserved.
//

import Foundation
extension HTTPURLResponse{
    var hasSuccessStatusCode: Bool {
        return 200...299 ~= statusCode
    }
}
