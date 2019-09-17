//
//  NewsArticleViewModels.swift
//  NYTNews
//
//  Created by Soriyany keo on 9/16/19.
//  Copyright © 2019 Soriyany keo. All rights reserved.
//

import Foundation
protocol NewsArticleViewModelsDelegate: class {
    func onFetchCompleted(with newIndexPathsToReload: [IndexPath]?)
    func onFetchFailed(with reason: String)
}

class NewsArticleViewModels{
    private weak var delegate: NewsArticleViewModelsDelegate?
    
    private var newsData:[Doc] = []
    private var currentPage = 0
    private var isFetchProgress = false
    
    let searchClient = SearchNewsArticleClient()
    let request: NewsArticleRequest
    
    init(request:NewsArticleRequest, delegate:NewsArticleViewModelsDelegate) {
        self.request = request
        self.delegate = delegate
    }
    var currentCount: Int{
        return newsData.count
    }
    func newsArticle(at index:Int) -> Doc{
        return newsData[index]
    }
    func saerchNews(){
        guard !isFetchProgress else {
            return
        }
        isFetchProgress = true
        searchClient.fetchNews(with: request, page: currentPage) { result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.currentPage += 1
                    self.isFetchProgress = false
                    self.newsData.append(contentsOf:response.response.docs)
                    self.delegate?.onFetchCompleted(with: .none)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.isFetchProgress = false
                    self.delegate?.onFetchFailed(with: error.reason)
                }
            }
        }
    }
}
