//
//  ViewController.swift
//  NYTNews
//
//  Created by Soriyany keo on 9/16/19.
//  Copyright © 2019 Soriyany keo. All rights reserved.
//

import UIKit

class SearchNewsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

//
// MARK: - Search Bar Delegate
//
extension SearchNewsVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text, !searchText.isEmpty else {
            return
        }
        print("search text:\(searchText)")
        //TODO: Call Service request
    }
}
