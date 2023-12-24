//
//  HomePageViewController.swift
//  CollegeComparator
//
//  Created by christopher conyersIV on 12/21/23.
//

import UIKit
import Charts

class HomePageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDel {
    
    @IBOutlet weak var tableView: UITableView!
    
    var school1 = [String]()
    var earn = [Double]()
    var school2 = [String]()
    var accR = [Double]()
    var school3 = [String]()
    var CPT = [Double]()

    var model = Model()
    
    var colleges = [Schools]()
    
    var accRates:[(name:String, acc:Double)] = []
    
    var med_earn:[(name:String, earn:Int)] = []
    
    var earnPerCost:[(name:String, earnPer:Double)] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        model.delegate = self
        
        model.getSchools()
        
        tableView.dataSource = self
        
        tableView.delegate = self
        
        // Do any additional setup after loading the view.

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Earnings_10yr") as! EarningsChartTableViewCell
        
        // pass correct data into each chart throgh configure
        
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Earnings_10yr") as! EarningsChartTableViewCell
            cell.configure(schools:school1, earnings: earn)
            cell.contentView.addSubview(cell.Earnings_10yr)
            return cell
            
            }
        
        if indexPath.row == 1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Acceptance_rate") as! AcceptanceTableViewCell
            cell.configure(schools: school2, acceptance: accR)
            cell.contentView.addSubview(cell.AcceptanceChart)
            return cell
            
            }
        
        if indexPath.row == 2 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cost_per") as! CostPerTableViewCell
            cell.configure(schools: school3, costPer: CPT)
            cell.contentView.addSubview(cell.CostPerChart)
            return cell
            
            }
        
            //... some other types of cells
        return cell
        
    }
    
    func getSchools(_ schools: [Schools]) {
        
        self.colleges = schools
        self.setData()

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200.0
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
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
        
        //print(accRates)
        
        for i in 0..<6 {
            
            let (s1, e) = self.med_earn[i]
            let (s2, a) = self.accRates[i]
            let (s3, cp) = self.earnPerCost[i]
            self.school1.append(s1)
            self.school2.append(s2)
            self.school3.append(s3)
            self.earn.append(Double(e))
            self.accR.append(Double(a))
            self.CPT.append(Double(cp))
            
        }
        
        tableView.reloadData()

        
    }
    
}
