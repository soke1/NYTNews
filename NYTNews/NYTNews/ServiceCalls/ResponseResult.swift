//
//  Result.swift
//  NYTNews
//
//  Created by Soriyany keo on 9/16/19.
//  Copyright © 2019 Soriyany keo. All rights reserved.
//

import Foundation
enum ResponseResult<T, U:Error>{
    case success(T)
    case failure(U)
}
