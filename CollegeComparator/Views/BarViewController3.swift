//
//  BarViewController3.swift
//  Playground
//
//  Created by christopher conyersIV on 12/18/23.
//

import Charts
import UIKit

class BarViewController3: UIViewController, ChartViewDelegate, AxisValueFormatter {
    
    var test = [String]()
    
    var scores = [Double]()
    
    func stringForValue(_ value: Double, axis: Charts.AxisBase?) -> String {
        //print("at string for value")
        if value >= 0 && Int(value) < test.count{
            let t = test[Int(value)]
            //print(prog)
            return t
        }
        return ""
    }
    
    var school: Schools?
    
    var test_scores:[(String, Double)] = []
    
    var barChart = BarChartView()
    
    weak var axisFormatDelegate: AxisValueFormatter?

    override func viewDidLoad() {
        //print("at view did load")
        
        barChart.noDataText = ""
        
        super.viewDidLoad()
        
        barChart.delegate = self
        
        axisFormatDelegate = self
        
        self.view.backgroundColor = UIColor.white

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        
        //print("at viewdidlayout chart")
        
        guard school != nil else {
            return
        }
        
        self.test_scores = school!.scores
        
        super.viewDidLayoutSubviews()
        
        barChart.frame = CGRect(x: 0, y: 200, width: self.view.frame.size.width, height: self.view.frame.size.height - 200)
        
        barChart.center = view.center
        
        barChart.xAxis.labelPosition = XAxis.LabelPosition.bottom
        
        barChart.xAxis.wordWrapEnabled = true
        
        barChart.xAxis.labelWidth = 22
        
        barChart.rightAxis.axisMinimum = 400.0
        
        //barChart.rightAxis.axisMaximum = 850.0
        
        barChart.extraBottomOffset = CGFloat(60.0)
        
        barChart.xAxis.labelFont = UIFont(name: "Verdana", size: 8.0)!
        
        barChart.leftAxis.enabled = false
        
        barChart.legend.enabled = false
        
        barChart.drawGridBackgroundEnabled = false
        
        barChart.xAxis.drawGridLinesEnabled = false
        
        barChart.leftAxis.drawGridLinesEnabled = false
        
        barChart.rightAxis.drawGridLinesEnabled = false
        
        for i in 0..<6 {
            
            let (title, score) = test_scores[i]
            
            test.append(title)
            
            scores.append(score)
            
        }
        
        setChart(dataEntryX: test, dataEntryY: scores)
        
        view.addSubview(barChart)
        
        barChart.fitScreen()
    }
    
    func setChart(dataEntryX forX:[String],dataEntryY forY: [Double]) {
        //print("at set chart")
        
            //viewForChart.noDataText = "You need to provide data for the chart."
            
        var dataEntries:[BarChartDataEntry] = []
        
        for i in 0..<forX.count{
                
                let dataEntry = BarChartDataEntry(x: Double(i), y: Double(forY[i]) , data: test as AnyObject?)
                
                dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Program")
        
        let chartData = BarChartData(dataSet: chartDataSet)
        
        barChart.data = chartData
        
        let xAxisValue = barChart.xAxis
        
        xAxisValue.valueFormatter = axisFormatDelegate
        
        }
}

