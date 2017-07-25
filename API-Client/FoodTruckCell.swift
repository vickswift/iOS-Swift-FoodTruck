//
//  FoodTruckCell.swift
//  API-Client
//
//  Created by Victor  Adu on 4/28/17.
//  Copyright © 2017 Victor  Adu. All rights reserved.
//

import UIKit

class FoodTruckCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var foodTypeLabel: UILabel!
    @IBOutlet weak var avgCostLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(truck: FoodTruck) {
        nameLabel.text = truck.name
        foodTypeLabel.text = truck.foodType
        avgCostLabel.text = "$\(truck.avgCost)"
    }

}
