//
//  tabBarViewController.swift
//  CollegeComparator
//
//  Created by christopher conyersIV on 12/21/23.
//

import UIKit

class tabBarViewController: UITabBarController {

    @IBOutlet weak var tabBars: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBars.items![0].title = "HomePage"
        tabBars.items![1].title = "Search Schools"

        // Do any additional setup after loading the view.
    }
    
}
