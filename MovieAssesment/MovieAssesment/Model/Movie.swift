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
    let rating: Double
    let overview: String
    let imagePath: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case rating = "vote_average"
        case overview
        case imagePath = "poster_path"
    }
}

