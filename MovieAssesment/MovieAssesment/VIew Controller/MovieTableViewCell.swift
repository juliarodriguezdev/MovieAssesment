//
//  MovieTableViewCell.swift
//  MovieAssesment
//
//  Created by Julia Rodriguez on 6/28/19.
//  Copyright © 2019 Julia Rodriguez. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    
    @IBOutlet weak var movieLabelText: UILabel!
    
    @IBOutlet weak var movieRatingText: UILabel!
    
    @IBOutlet weak var movieSummaryText: UITextView!
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
