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

    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var satLabel: UILabel!
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var textView: UITextView!
    
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
        
        titleLabel.text = school!.schoolName
        
        satLabel.text = String(describing: school!.sat)
        
        textView.text = String(describing: school!.facSalary)
        
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
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
