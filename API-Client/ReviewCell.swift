//
//  ReviewCell.swift
//  API-Client
//
//  Created by Victor  Adu on 4/28/17.
//  Copyright © 2017 Victor  Adu. All rights reserved.
//

import UIKit

class ReviewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var reviewTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(review: FoodTruckReview) {
        titleLabel.text = review.title
        reviewTextLabel.text = review.text
    }

}
