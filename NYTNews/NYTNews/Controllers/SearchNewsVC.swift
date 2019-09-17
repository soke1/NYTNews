//
//  ViewController.swift
//  NYTNews
//
//  Created by Soriyany keo on 9/16/19.
//  Copyright © 2019 Soriyany keo. All rights reserved.
//

import UIKit

class SearchNewsVC: UIViewController {
    private var newArticleVM:NewsArticleViewModels!
    var countCells = 0
    
    @IBOutlet var newsArticleTV: UITableView!
    @IBOutlet weak var loadIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newsArticleTV.isHidden = true
        newsArticleTV.dataSource = self
        loadIndicator.isHidden = true
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
        newsArticleTV.isHidden = true
        let request = NewsArticleRequest.from(search: searchText)
        newArticleVM = NewsArticleViewModels(request: request, delegate: self)
        newArticleVM.saerchNews()
        loadIndicator.startAnimating()
        
        //TODO: Call Service request and load to table view when scrolled to the bottom (pagination of results)
    }
}

//
// MARK: - TableView News Article ViewModels Delegate
//
extension SearchNewsVC:NewsArticleViewModelsDelegate{
    func onFetchCompleted(with newIndexPathsToReload: [IndexPath]?) {
        loadIndicator.stopAnimating()
        countCells = newArticleVM.currentCount
        newsArticleTV.isHidden = false
        newsArticleTV.reloadData()
    }
    
    func onFetchFailed(with reason: String) {
        loadIndicator.stopAnimating()
        let title = "Warning"
        let action = UIAlertAction(title: "OK", style: .default)
        let alertController = UIAlertController(title: title, message: reason, preferredStyle: .alert)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
}

//
// MARK: - TableView DataSource
//
extension SearchNewsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsCell
        
        if newArticleVM != nil{
            cell.setup(doc: newArticleVM.newsArticle(at: indexPath.row))
        }
        return cell
    }
}
