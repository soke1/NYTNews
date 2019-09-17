//
//  NewsCell.swift
//  NYTNews
//
//  Created by Soriyany keo on 9/16/19.
//  Copyright © 2019 Soriyany keo. All rights reserved.
//

import UIKit
class NewsCell: UITableViewCell {
    private lazy var baseURL: URL = {
        return URL(string: "https://www.nytimes.com/")!
    }()
    
    @IBOutlet var thumbnailImageView: UIImageView!
    @IBOutlet weak var headlineLbl: UILabel!
    
    func setup(doc:Doc?){
        if let doc = doc{
            headlineLbl.text = doc.headline.main
            
            if let mediaURL = doc.multimedia.first{
                let urlString = "\(baseURL)\(mediaURL.url)"
                let url = URL(string:urlString)
                DispatchQueue.global().async { [weak self] in
                    if let data = try? Data(contentsOf: url! ) {
                        if let image = UIImage(data: data) {
                            DispatchQueue.main.async {
                                self?.thumbnailImageView.image = image
                            }
                        }
                    }
                }
            }
        }
    }
}
