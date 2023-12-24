//
//  LabelTableViewCell.swift
//  CollegeComparator
//
//  Created by christopher conyersIV on 12/24/23.
//

import UIKit

class LabelTableViewCell: UITableViewCell {

    @IBOutlet weak var leaders: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        leaders.text = "Top Rated U.S. Colleges by Earnings" + "\n" + "and Acceptance Rate"
        leaders.textAlignment = .center
        leaders.frame = CGRect(x: 0, y: 0, width: 400, height: 100)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
