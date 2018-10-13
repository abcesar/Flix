//
//  NowPlayingViewController.swift
//  Flix
//
//  Created by Cesar Gutierrez on 9/22/18.
//  Copyright © 2018 Cesar Gutierrez. All rights reserved.
//

import UIKit
import AlamofireImage

class NowPlayingViewController: UIViewController,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var movies: [Movie] = []
    var refreshControl: UIRefreshControl!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(NowPlayingViewController.pullToRefresh(_:)), for: .valueChanged)
        tableView.insertSubview(refreshControl, at: 0)
        
        
        tableView.dataSource = self as UITableViewDataSource
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        
        
        activityIndicator.startAnimating()
        
        MovieApiManager().getNowPlayingMovies { (movies, error) in
            if let movies = movies {
                self.movies = movies
                self.tableView.reloadData()
                self.activityIndicator.stopAnimating()
            }
        }
    }
    
    
    @objc func pullToRefresh(_ refreshControl: UIRefreshControl) {
        MovieApiManager().getNowPlayingMovies { (movies, error) in
            if let movies = movies {
                self.movies = movies
                self.tableView.reloadData()
                refreshControl.endRefreshing()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        if let index = tableView.indexPath(for: cell) {
            let newDetailView = segue.destination as! DetailViewController
            newDetailView.movie = movies[index.row]
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        cell.movie = movies[indexPath.row]
        return cell
    }
    
}
