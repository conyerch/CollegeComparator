//
//  HomePageViewController.swift
//  CollegeComparator
//
//  Created by christopher conyersIV on 12/21/23.
//

import UIKit

class HomePageViewController: UIViewController, ModelDel {
    
    var model = Model()
    
    var colleges = [Schools]()
    
    var accRates:[(name:String, acc:Double)] = []
    
    var med_earn:[(name:String, earn:Int)] = []
    
    var earnPerCost:[(name:String, earnPer:Double)] = []
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var welcomeText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model.delegate = self
        model.getSchools()
        welcomeLabel.textAlignment = .center
        
        welcomeText.text = "Compare the top US colleges by earnings, awards, Pell recipients, tuition, faculty, and divsersity, or search for individual school data"

        // Do any additional setup after loading the view.
    }
    
    func getSchools(_ schools: [Schools]) {
        self.colleges = schools
        setData()

    }
    
    func setData() {
        
        for i in 0..<self.colleges.count {
        
            self.accRates.append((colleges[i].schoolName, colleges[i].acc_rate!))
            self.med_earn.append((colleges[i].schoolName, colleges[i].med_10yr!))
            self.earnPerCost.append((colleges[i].schoolName, Double(colleges[i].med_10yr! / colleges[i].cost!)))
        }
        
        self.accRates = self.accRates.sorted(by: {$0.acc < $1.acc})
        self.med_earn = self.med_earn.sorted(by: {$0.earn < $1.earn})
        self.earnPerCost = self.earnPerCost.sorted(by: {$0.earnPer < $1.earnPer})
        
        print(self.accRates)
        
    }

}
