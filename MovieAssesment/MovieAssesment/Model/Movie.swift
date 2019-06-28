//
//  Movie.swift
//  MovieAssesment
//
//  Created by Julia Rodriguez on 6/28/19.
//  Copyright © 2019 Julia Rodriguez. All rights reserved.
//

import UIKit

struct TopLevelJSON: Codable {
    let results: [Movie]
}
struct Movie: Codable {
    
    let title: String
    let rating: String
    let overview: String
    let imagePath: String
    let movieID: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case rating = "vote_average"
        case overview
        case imagePath = "poster_path"
        case movieID = "movie_id"
    }
}




// Image: /size/file_path
// https://image.tmdb.org/t/p/original/wwemzKWzjKYJFfCeiB57q3r4Bcm.svg
