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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
