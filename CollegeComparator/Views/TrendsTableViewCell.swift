//
//  TrendsTableViewCell.swift
//  CollegeComparator
//
//  Created by christopher conyersIV on 12/25/23.
//

import UIKit

class TrendsTableViewCell: UITableViewCell {

    @IBOutlet weak var trendsLabel: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        trendsLabel.text = "Recent Economic and Social Trends" + "\n" + " Across U.S. Colleges"
        trendsLabel.textAlignment = .center
        trendsLabel.frame = CGRect(x: 0, y: 0, width: 400, height: 100)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
