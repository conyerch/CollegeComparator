//
//  DetailViewController.swift
//  college-scorecard
//
//  Created by christopher conyersIV on 12/5/23.
//

import UIKit
import WebKit
import Charts

class DetailViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var visitLabel: UILabel!
    
    @IBOutlet weak var endText: UITextView!
    
    var schoolString = ""
    
    var school: Schools?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        guard school != nil else {
            
            return
            
        }
        
        // set the fields
        
        stackView.setCustomSpacing(20, after: titleLabel)
        
        titleLabel.text = school!.schoolName
        
        titleLabel.textColor = .black
        
        titleLabel.textAlignment = .center
        
        visitLabel.text = "Visit " + school!.schoolName + "'s Homepage" + "\n"
        
        visitLabel.textAlignment = .center
        
        var satString = String(describing: school!.sat!)
        
        var tuitionString = String(describing: school!.cost!)
        
        var facString = String(describing: school!.facSalary!)
        
        var expString = String(describing: school!.ave_fte!)
        
        if school!.sat! == -1 {
            
            satString = "not reported"
        }
        
        if school!.cost! == -1 {
            
            tuitionString = "not reported"
        }
        
        if school!.cost! == 0 {
            
            facString = "not reported"
        }
        
        if school!.cost! == 0 {
            
            expString = "not reported"
        }
        
        endText.text = "Explore more statistics from " + school!.schoolName + "'s most recent data releases using the tabs below, including graduate earnings, common majors, and standardized scoring"
        
        textView.text = "Average Faculty Compensation: " + facString + "\n" + "Average Student SAT Score: " + satString + "\n" + "Latest Tution Cost: " + tuitionString + "\n" + "Average Expenditure Per Student: " + expString + "\n"
        
        textView.textAlignment = .center
        
        endText.textAlignment = .center
        
        // guard that we received a valid url
        if school?.web != nil {
            
            self.schoolString = school!.web
            
            // logic for testing whether website needs to have https appended
        
            let index = self.schoolString.index(self.schoolString.startIndex, offsetBy: 4)
            
            let mySubstring = schoolString[..<index]

            // creating url
            
            if mySubstring != "http" {
                
                self.schoolString = "https://" + self.schoolString
                
            }
            
        }
            
            else {
            
                self.schoolString = "https://www.ed.gov/"
            
        }
        
        // copy school website url to local variable
        
        let myURL = URL(string:self.schoolString)
        
        let myRequest = URLRequest(url: myURL!)
        
        webView.load(myRequest)
        
        webView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height - 400)
        
    }

}
