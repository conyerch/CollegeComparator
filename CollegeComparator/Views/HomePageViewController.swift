//
//  HomePageViewController.swift
//  CollegeComparator
//
//  Created by christopher conyersIV on 12/21/23.
//

import UIKit
import Charts

class HomePageViewController: UIViewController, ModelDel, ChartViewDelegate, AxisValueFormatter {
    
    func stringForValue(_ value: Double, axis: Charts.AxisBase?) -> String {
        return "example"
    }
    
    
    var model = Model()
    
    var earningsChart = BarChartView()
    
    var acceptanceRateChart = BarChartView()
    
    var earnPerCostChart = BarChartView()
    
    var colleges = [Schools]()
    
    var accRates:[(name:String, acc:Double)] = []
    
    var med_earn:[(name:String, earn:Int)] = []
    
    var earnPerCost:[(name:String, earnPer:Double)] = []
    
    weak var axisFormatDelegate: AxisValueFormatter?
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var welcomeText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        axisFormatDelegate = self
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
        
    }
    
    override func viewDidLayoutSubviews() {
        view.addSubview(earningsChart)
        
        super.viewDidLayoutSubviews()
        
        earningsChart.frame = CGRect(x: 0, y: 200, width: self.view.frame.size.width, height: self.view.frame.size.height - 300)
        
        earningsChart.center = view.center
        
        setChart(dataEntryX: ["example"], dataEntryY: [1.0])
        
        earningsChart.fitScreen()
    }
    
    func setChart(dataEntryX forX:[String],dataEntryY forY: [Double]) {
        
            //viewForChart.noDataText = "You need to provide data for the chart."
            
        var dataEntries:[BarChartDataEntry] = []
        
            for i in 0..<forX.count{
                
                let dataEntry = BarChartDataEntry(x: Double(i), y: Double(forY[i]) , data: ["example"] as AnyObject?)
                
                //print(dataEntry)
                
                dataEntries.append(dataEntry)
            }
            let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Program")
        
            let chartData = BarChartData(dataSet: chartDataSet)
        
            earningsChart.data = chartData
        
            let xAxisValue = earningsChart.xAxis
        
            xAxisValue.valueFormatter = axisFormatDelegate
        
    }

}
