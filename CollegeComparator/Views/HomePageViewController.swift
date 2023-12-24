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
        
        tableView.reloadData()
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
            
            }
        
        if indexPath.row == 1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Acceptance_rate") as! AcceptanceTableViewCell
            cell.configure(schools: school2, acceptance: accR)
            
            }
        
        if indexPath.row == 2 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cost_per") as! CostPerTableViewCell
            cell.configure(schools: school3, costPer: CPT)
            
            }
        
            //... some other types of cells
        
        tableView.reloadRows(at: [indexPath], with: .none)
        return cell
        
    }
    
    func getSchools(_ schools: [Schools]) {
        
        self.colleges = schools
        tableView.reloadData()

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200.0
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
    }
    
    
    /*
    
    func setData() {
        
        for i in 0..<self.colleges.count {
        
            self.accRates.append((colleges[i].schoolName, colleges[i].acc_rate!))
            self.med_earn.append((colleges[i].schoolName, colleges[i].med_10yr!))
            self.earnPerCost.append((colleges[i].schoolName, Double(colleges[i].med_10yr! / colleges[i].cost!)))
        }
        
        self.accRates = self.accRates.sorted(by: {$0.acc < $1.acc})
        self.med_earn = self.med_earn.sorted(by: {$0.earn < $1.earn})
        self.earnPerCost = self.earnPerCost.sorted(by: {$0.earnPer < $1.earnPer})  
        
    }
    
    override func viewDidLayoutSubviews() {
        view.addSubview(earningsChart)
        
        super.viewDidLayoutSubviews()
        
        earningsChart.frame = CGRect(x: 0, y: 200, width: self.view.frame.size.width, height: self.view.frame.size.height - 300)
        
        earningsChart.center = view.center
        
        for i in 0..<6 {
            
            let (s1, e) = med_earn[i]
            let (s2, a) = accRates[i]
            let (s3, cp) = earnPerCost[i]
            school1.append(s1)
            school2.append(s2)
            school3.append(s3)
            earn.append(Double(e))
            accR.append(Double(a))
            CPT.append(Double(cp))
            
        }
        
        setChart(dataEntryX: school1, dataEntryY: earn)
        
        earningsChart.fitScreen()
    }
    
    func setChart(dataEntryX forX:[String],dataEntryY forY: [Double]) {
        
            //viewForChart.noDataText = "You need to provide data for the chart."
            
        var dataEntries:[BarChartDataEntry] = []
        
            for i in 0..<forX.count{
                
                let dataEntry = BarChartDataEntry(x: Double(i), y: Double(forY[i]) , data: school1 as AnyObject?)
                
                //print(dataEntry)
                
                dataEntries.append(dataEntry)
            }
        
            let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Program")
        
            let chartData = BarChartData(dataSet: chartDataSet)
        
            earningsChart.data = chartData
        
            let xAxisValue = earningsChart.xAxis
        
            xAxisValue.valueFormatter = axisFormatDelegate
        
    }*/

}
