//
//  NewsArticleDetailVC.swift
//  NYTNews
//
//  Created by Soriyany keo on 9/16/19.
//  Copyright © 2019 Soriyany keo. All rights reserved.
//

import UIKit

class NewsArticleDetailVC: UIViewController {
    var url:String?
    @IBOutlet weak var newsArticleWV: UIWebView!
    @IBOutlet weak var loadIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: self.url!)
        let requestObj = URLRequest(url: url!)
        newsArticleWV.loadRequest(requestObj)
    }
    
}
extension NewsArticleDetailVC: UIWebViewDelegate{
    func webViewDidStartLoad(_ webView: UIWebView){
        print("Webview started Loading")
        loadIndicator.startAnimating()
        
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("Webview did finish load")
        loadIndicator.stopAnimating()
    }
}
