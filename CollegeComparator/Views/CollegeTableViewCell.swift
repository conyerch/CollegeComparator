//
//  CollegeTableViewCell.swift
//  college-scorecard
//
//  Created by christopher conyersIV on 12/3/23.
//

import UIKit

class CollegeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collegeName: UILabel!
    
  
    @IBOutlet weak var studentSize: UILabel!
    
    var school:Schools?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ s:Schools) {
        
        self.school = s
        
        guard self.school != nil else {
            
            return
        }
        
        self.collegeName.text = school?.schoolName
        
        let mys = "Student Body Size: " + String(describing: school!.studentSize!)
        
        self.studentSize.text = mys
        
        
    }

}
