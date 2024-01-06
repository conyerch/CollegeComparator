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
        
        barChart.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 700)
        
        barChart.center = view.center
        
        barChart.extraTopOffset = 100.0
        
        barChart.xAxis.labelPosition = XAxis.LabelPosition.bottom
        
        barChart.xAxis.wordWrapEnabled = true
        
        barChart.xAxis.labelWidth = 22
        
        barChart.rightAxis.axisMinimum = 400.0
        
        //barChart.rightAxis.axisMaximum = 850.0
        
        barChart.extraBottomOffset = CGFloat(60.0)
        
        barChart.xAxis.labelFont = UIFont(name: "Verdana", size: 8.0)!
        
        barChart.leftAxis.enabled = false
        
        barChart.legend.enabled = true
        
        barChart.legend.horizontalAlignment = .center
        
        barChart.legend.verticalAlignment = .bottom
        
        barChart.legend.orientation = .horizontal
        
        barChart.legend.yOffset = 25.0
        
        barChart.legend.xOffset = 20.0
        
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
        
        var dataEntries2:[BarChartDataEntry] = []
        
        var dataEntries3:[BarChartDataEntry] = []
        
        for i in 0..<2{
                
                let dataEntry = BarChartDataEntry(x: Double(i), y: Double(forY[i]) , data: test as AnyObject?)
                
                dataEntries.append(dataEntry)
        }
        
        for i in 2..<4{
                
                let dataEntry = BarChartDataEntry(x: Double(i), y: Double(forY[i]) , data: test as AnyObject?)
                
                dataEntries2.append(dataEntry)
        }
        
        for i in 4..<6{
                
                let dataEntry = BarChartDataEntry(x: Double(i), y: Double(forY[i]) , data: test as AnyObject?)
                
                dataEntries3.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Writing SAT")
        
        chartDataSet.setColor(.purple)
        
        let chartDataSet2 = BarChartDataSet(entries: dataEntries2, label: "Math SAT")
        
        chartDataSet2.setColor(.blue)
        
        let chartDataSet3 = BarChartDataSet(entries: dataEntries3, label: "Reading SAT")
        
        let chartData = BarChartData(dataSets: [chartDataSet, chartDataSet2, chartDataSet3])
        
        barChart.data = chartData
        
        let xAxisValue = barChart.xAxis
        
        xAxisValue.valueFormatter = axisFormatDelegate
        
        }
}

