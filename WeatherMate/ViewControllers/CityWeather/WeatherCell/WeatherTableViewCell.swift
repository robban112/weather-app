//
//  WeatherTableViewCell.swift
//  WeatherMate
//
//  Created by Robert Lorentz on 2019-10-29.
//  Copyright © 2019 Robert Lorentz. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var weatherIconLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
