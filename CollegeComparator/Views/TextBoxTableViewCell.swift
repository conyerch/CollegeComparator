//
//  TextBoxTableViewCell.swift
//  CollegeComparator
//
//  Created by christopher conyersIV on 12/24/23.
//

import UIKit

class TextBoxTableViewCell: UITableViewCell {

    @IBOutlet weak var textBox: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        textBox.text = "Welcome to College Comps, your home for comparing the latest trends in U.S. college earnings, return on tuition investment, acceptance rates and more, as well as finding individual college statistics using our Search Schools feature."
        
        textBox.textAlignment = .center
        
        textBox.frame = CGRect(x: 20, y: 0, width: 350, height: 100)
      
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
