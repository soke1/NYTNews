//
//  DataResponseError.swift
//  NYTNews
//
//  Created by Soriyany keo on 9/16/19.
//  Copyright © 2019 Soriyany keo. All rights reserved.
//

import Foundation
enum DataResponseError: Error {
    case network
    case decoding
    
    var reason:String {
        switch self {
        case .network:
            return "An error occured while fetching data"
        case .decoding:
            return "An error occured while decoding data"
        }
    }
}
