//
//  CostPerTableViewCell.swift
//  CollegeComparator
//
//  Created by christopher conyersIV on 12/23/23.
//

import UIKit
import Charts

class CostPerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var CostPerChart: BarChartView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(schools:[String], costPer:[Double]) {
        
    }

}