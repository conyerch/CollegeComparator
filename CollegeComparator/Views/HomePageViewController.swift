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
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var school1 = [String]()
    
    var earn = [Double]()
    
    var school2 = [String]()
    
    var accR = [Double]()
    
    var school3 = [String]()
    
    var CPT = [Double]()
    
    var school4 = [String]()
    
    var eng_perc = [Double]()
    
    var school5 = [String]()
    
    var mathScores = [Double]()
    
    var school6 = [String]()
    
    var compSci = [Double]()
    
    var school7 = [String]()
    
    var readScores = [Double]()
    
    var school8 = [String]()
    
    var health_perc = [Double]()

    var model = Model()
    
    var colleges = [Schools]()
    
    var accRates:[(name:String, acc:Double)] = []
    
    var med_earn:[(name:String, earn:Int)] = []
    
    var earnPerCost:[(name:String, earnPer:Double)] = []
    
    var engineeringMajor:[(name:String, perc:Double)] = []
    
    var satMath:[(name:String, sat:Double)] = []
    
    var compSciMajor:[(name:String, perc:Double)] = []
    
    var satRead:[(name:String, sat:Double)] = []
    
    var healthMajor:[(name:String, perc:Double)] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        model.delegate = self
        
        model.getSchools()
        
        tableView.dataSource = self
        
        tableView.delegate = self
        
        titleLabel.text = "College Comps"
        
        titleLabel.textAlignment = .center
        
        // Do any additional setup after loading the view.

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 12
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Earnings_10yr") as! EarningsChartTableViewCell
        
        // pass correct data into each chart throgh configure
        
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "textBox") as! TextBoxTableViewCell
            cell.contentView.addSubview(cell.textBox)
            return cell
            
            }
        
        if indexPath.row == 1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Leaders") as! LabelTableViewCell
            cell.contentView.addSubview(cell.leaders)
            cell.userInteractionEnabledWhileDragging = false
            return cell
            
            }
        
        if indexPath.row == 2 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Earnings_10yr") as! EarningsChartTableViewCell
            cell.Earnings_10yr.noDataText = ""
            cell.configure(schools:school1, earnings: earn)
            cell.Earnings_10yr.dragEnabled = false
            cell.contentView.addSubview(cell.EarningsText)
            cell.contentView.addSubview(cell.Earnings_10yr)
            cell.userInteractionEnabledWhileDragging = false
            return cell
            
            }
        
        if indexPath.row == 3 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Acceptance_rate") as! AcceptanceTableViewCell
            cell.AcceptanceChart.noDataText = ""
            cell.configure(schools: school2, acceptance: accR)
            cell.AcceptanceChart.dragEnabled = false
            cell.contentView.addSubview(cell.AcceptanceChart)
            cell.userInteractionEnabledWhileDragging = false
            return cell
            
            }
        
        if indexPath.row == 4 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cost_per") as! CostPerTableViewCell
            cell.CostPerChart.noDataText = ""
            cell.configure(schools: school3, cp: CPT)
            cell.CostPerChart.dragEnabled = false
            cell.contentView.addSubview(cell.CostPerChart)
            cell.userInteractionEnabledWhileDragging = false
            return cell
            
            }
        
        if indexPath.row == 5 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "trends") as! TrendsTableViewCell
            cell.contentView.addSubview(cell.trendsLabel)
            cell.userInteractionEnabledWhileDragging = false
            return cell
            
            }
        
        if indexPath.row == 6 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "engineering") as! EngineeringTableViewCell
            cell.configure(schools: school4, engineeringPercent: eng_perc)
            cell.EngineeringChart.dragEnabled = false
            cell.contentView.addSubview(cell.EngineeringChart)
            cell.userInteractionEnabledWhileDragging = false
            return cell
            
            }
        
        if indexPath.row == 7 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "computerScience") as! CompSciTableViewCell
            cell.configure(schools: school6, engineeringPercent: compSci)
            cell.CompSciChart.dragEnabled = false
            cell.contentView.addSubview(cell.CompSciChart)
            cell.userInteractionEnabledWhileDragging = false
            return cell
            
            }
        
        if indexPath.row == 8 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "health") as! HealthTableViewCell
            cell.configure(schools: school8, healthPercent: health_perc)
            cell.HealthChart.dragEnabled = false
            cell.contentView.addSubview(cell.HealthChart)
            cell.userInteractionEnabledWhileDragging = false
            return cell
            
            }
        
        if indexPath.row == 9 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "scores") as! TrendsTableViewCell
            cell.contentView.addSubview(cell.trendsLabel)
            cell.userInteractionEnabledWhileDragging = false
            return cell
            
            }
        
        if indexPath.row == 10 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "MathScores") as! SatMathTableViewCell
            cell.configure(schools: school5, mathScores: mathScores)
            cell.ScoreChart.dragEnabled = false
            cell.contentView.addSubview(cell.ScoreChart)
            cell.userInteractionEnabledWhileDragging = false
            return cell
            
            }
        
        if indexPath.row == 11 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReadScores") as! SatReadTableViewCell
            cell.configure(schools: school7, mathScores: readScores)
            cell.readChart.dragEnabled = false
            cell.readChart.dragEnabled = false
            cell.contentView.addSubview(cell.readChart)
            cell.userInteractionEnabledWhileDragging = false
            return cell
            
            }
        
        return cell
        
    }
    
    func getSchools(_ schools: [Schools]) {
        
        self.colleges = schools
        self.setData()

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 120
        }
        
        if (indexPath.row == 1 || indexPath.row == 5 || indexPath.row == 9) {
            return 50
        }
        
        if indexPath.row == 2 || indexPath.row == 11 {
            return 260
        }
        
        if indexPath.row == 10  {
            return 270
        }
            
        return 280
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
    }
    
    func setData() {
        
        for i in 0..<self.colleges.count {
        
            self.accRates.append((colleges[i].schoolName, colleges[i].acc_rate!))
            
            self.med_earn.append((colleges[i].schoolName, colleges[i].med_10yr!))
            
            self.earnPerCost.append((colleges[i].schoolName, Double(Double(colleges[i].med_10yr!) / Double(colleges[i].cost!))))
            
            self.satMath.append((colleges[i].schoolName, Double(colleges[i].sat_25_math!)))
            
            self.engineeringMajor.append((colleges[i].schoolName, colleges[i].perc_engin!))
            
            self.compSciMajor.append((colleges[i].schoolName, colleges[i].perc_comp!))
            
            self.satRead.append((colleges[i].schoolName, Double(colleges[i].sat_25_read!)))
            
            self.healthMajor.append((colleges[i].schoolName, Double(colleges[i].perc_business!)))
            
        }
        
        self.accRates = self.accRates.sorted(by: {$0.acc < $1.acc})
        
        self.med_earn = self.med_earn.sorted(by: {$0.earn > $1.earn})
        
        self.earnPerCost = self.earnPerCost.sorted(by: {$0.earnPer > $1.earnPer})
        
        self.satMath = self.satMath.sorted(by: {$0.sat > $1.sat})
        
        self.engineeringMajor = self.compSciMajor.sorted(by: {$0.perc > $1.perc})
        
        self.satRead = self.satRead.sorted(by: {$0.sat > $1.sat})
        
        self.compSciMajor = self.compSciMajor.sorted(by: {$0.perc > $1.perc})
        
        self.healthMajor = self.healthMajor.sorted(by: {$0.perc > $1.perc})
        
        for i in 0..<6 {
            
            let (s1, e) = self.med_earn[i]
            
            let (s2, a) = self.accRates[i]
            
            let (s3, cp) = self.earnPerCost[i]
            
            let (s4, ep) = self.engineeringMajor[i]
            
            let (s5, ms) = self.satMath[i]
            
            let (s6, csp) = self.compSciMajor[i]
            
            let (s7, rs) = self.satRead[i]
            
            let (s8, hs) = self.healthMajor[i]
            
            self.school1.append(s1)
            
            self.school2.append(s2)
            
            self.school3.append(s3)
            
            self.school4.append(s4)
            
            self.school5.append(s5)
            
            self.school6.append(s6)
            
            self.school7.append(s7)
            
            self.school8.append(s8)
            
            self.earn.append(Double(e))
            
            self.accR.append(Double(a))
            
            self.CPT.append(Double(cp))
            
            self.eng_perc.append(Double(ep))
            
            self.mathScores.append(Double(ms))
            
            self.compSci.append(Double(csp))
            
            self.readScores.append(Double(rs))
            
            self.health_perc.append(Double(hs))
            
        }
    
        tableView.reloadData()
        
    }
    
}
