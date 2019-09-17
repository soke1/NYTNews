//
//  SearchNewsClient.swift
//  NYTNews
//
//  Created by Soriyany keo on 9/16/19.
//  Copyright © 2019 Soriyany keo. All rights reserved.
//

import Foundation

class SearchNewsArticleClient {
    private lazy var baseURL: URL = {
        return URL(string: "https://api.nytimes.com/svc/search/v2/")!
    }()
    
    let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func fetchNews(with request: NewsArticleRequest, page: Int, completion: @escaping (ResponseResult<NewsArticleResponse, DataResponseError>) -> Void) {
        let urlRequest = URLRequest(url: baseURL.appendingPathComponent(request.path))
        let parameters = ["page": "\(page)"].merging(request.parameters, uniquingKeysWith: +)
        let encodedURLRequest = urlRequest.encode(with: parameters)
        
        session.dataTask(with: encodedURLRequest, completionHandler: { data, response, error in
            guard
                let httpResponse = response as? HTTPURLResponse,
                httpResponse.hasSuccessStatusCode,
                let data = data
                else {
                    completion(ResponseResult.failure(DataResponseError.network))
                    return
            }
            guard let decodedResponse = try? JSONDecoder().decode(NewsArticleResponse.self, from: data) else {
                completion(ResponseResult.failure(DataResponseError.decoding))
                return
            }
            
            completion(ResponseResult.success(decodedResponse))
        }).resume()
    }
}
