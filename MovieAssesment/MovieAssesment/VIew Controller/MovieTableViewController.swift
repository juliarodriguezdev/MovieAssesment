//
//  MovieTableViewController.swift
//  MovieAssesment
//
//  Created by Julia Rodriguez on 6/28/19.
//  Copyright © 2019 Julia Rodriguez. All rights reserved.
//

import UIKit

class MovieTableViewController: UITableViewController {
    
    @IBOutlet weak var movieSearchBar: UISearchBar!
    
    var movie: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movie.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieTableViewCell else { return UITableViewCell()}

        let movieItem = movie[indexPath.row]
        
        cell.movieLabelText.text = movieItem.title
        cell.movieRatingText.text = movieItem.rating
        cell.movieSummaryText.text = movieItem.overview
        cell.movieImage.image = UIImage(contentsOfFile: movieItem.imagePath)
        
        return cell
    }

}

extension MovieTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let movieSearch = searchBar.text, movieSearch != "" else { return }
        
        MovieController.fetchMovieItem(movie: movieSearch) { (movie) in
            if let unwrappedMovie = movie {
                self.movie = unwrappedMovie
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
    }
}
