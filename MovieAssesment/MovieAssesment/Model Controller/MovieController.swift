//
//  MovieController.swift
//  MovieAssesment
//
//  Created by Julia Rodriguez on 6/28/19.
//  Copyright © 2019 Julia Rodriguez. All rights reserved.
//

import UIKit

class MovieController {
    
// json url file to decode data
//https://api.themoviedb.org/3/search/movie?api_key=a5cd402718fc47c098a296dd7eb9c4dd&query=jaws
///l1yltvzILaZcx2jYvc5sEMkM7Eh.jpg
    static let baseURL = URL(string: "https://api.themoviedb.org/3/search/movie")
    
    static let imageBaseURL = URL(string: "http://image.tmdb.org/t/p/w185")
    
    // Create function to fetch movies, with completion handler
    static func fetchMovieItem(movie: String, completion: @escaping ([Movie]?) -> Void) {
        
        // unwrap url
        guard let url = baseURL else { completion(nil); return}
        
        // Add components to url
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        // Add query items (?key=value)
        let apiKeyQueryItem = URLQueryItem(name: "api_key", value: "a5cd402718fc47c098a296dd7eb9c4dd")
        
        let searchQueryItem = URLQueryItem(name: "query", value: movie)
        
        // Add query items to full url
        components?.queryItems = [apiKeyQueryItem, searchQueryItem]
        
        // create a constant for finalURL
        guard let finalURL = components?.url else { completion(nil); return}
        print(finalURL)
        // Create URLSession
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print("An error occured during urlSession task: \(error.localizedDescription)")
                completion(nil)
                return
            }
            guard let data = data else { completion(nil); return }
            
            // try to decode the data if we have no errors
            do {
                let decoder = JSONDecoder()
                let topLevelDictionary = try decoder.decode(TopLevelJSON.self, from: data)
                completion(topLevelDictionary.results)
            } catch {
                print("Error decoding JSON data: \(error.localizedDescription)")
                completion(nil)
                return
            }
        }.resume()
        
    }
        static func fetchMovieImage(movie: Movie, completion: @escaping (UIImage?) -> Void) {
            
            guard let url = imageBaseURL else { completion(nil); return}
            
            let components = URLComponents(url: url, resolvingAgainstBaseURL: true)
            
            let imageComponent = URLComponents(string: movie.imagePath)
            
            guard let imageURL = components?.url else { completion(nil); return}
            

        }

    

}
