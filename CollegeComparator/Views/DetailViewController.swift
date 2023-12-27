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
    
    @IBOutlet weak var satLabel: UILabel!
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var visitLabel: UILabel!
    
    @IBOutlet weak var endText: UITextView!
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
        
        satLabel.text = "Descriptive Statistics"
        
        satLabel.textAlignment = .left
        
        visitLabel.text = "Visit " + school!.schoolName + "'s Homepage" + "\n"
        
        visitLabel.textAlignment = .left
        
        endText.text = "Explore more statistics from " + school!.schoolName + "'s most recent data releases using the tabs below, including information on graduate earnings, most common majors, and standardized scores"
        
        textView.text = "Average Faculty Compensation: " + String(describing: school!.facSalary!) + "\n" + "Average Student SAT Score: " + String(describing: school!.sat!) + "\n" + "Latest Tution Cost: " + String(describing: school!.cost!) + "\n" + "Average Expenditure Per Student: " + String(describing: school!.ave_fte!) + "\n"
        
        textView.textAlignment = .center
        
        endText.textAlignment = .center
        
        // guard that we received a valid url
        guard school?.web != nil else {
            
            return
        }
        
        // copy school website url to local variable
        var schoolString = school!.web
        
        // logic for testing whether website needs to have https appended
    
        let index = schoolString.index(schoolString.startIndex, offsetBy: 4)
        
        let mySubstring = schoolString[..<index]

        // creating url
        
        if mySubstring != "http" {
            
            schoolString = "https://" + schoolString
        }
        
        let myURL = URL(string:schoolString)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
        webView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height - 400)
        
    }

}
