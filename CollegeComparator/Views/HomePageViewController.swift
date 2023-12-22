//
//  HomePageViewController.swift
//  CollegeComparator
//
//  Created by christopher conyersIV on 12/21/23.
//

import UIKit

class HomePageViewController: UIViewController {
    
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var welcomeText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.textAlignment = .center
        
        welcomeText.text = "Compare the top US colleges by earnings, awards, Pell recipients, tuition, faculty, and divsersity, or search for individual school data"

        // Do any additional setup after loading the view.
    }

}
