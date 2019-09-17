//
//  URLRequest.swift
//  NYTNews
//
//  Created by Soriyany keo on 9/16/19.
//  Copyright © 2019 Soriyany keo. All rights reserved.
//

import Foundation
typealias Parameters = [String:String]

extension URLRequest{
    func encode(with parameters:Parameters?) -> URLRequest{
        guard let parameters = parameters else{
            return self
        }
        
        var encodeURLRequest = self
        
        if let url = self.url,
            let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false),
            !parameters.isEmpty {
            var newURLComponents = urlComponents
            let queryItems = parameters.map{key,value in
                URLQueryItem(name: key, value: value)
            }
            
            newURLComponents.queryItems = queryItems
            encodeURLRequest.url = newURLComponents.url
            return encodeURLRequest
        }
        else{
            return self
        }
    }
}
