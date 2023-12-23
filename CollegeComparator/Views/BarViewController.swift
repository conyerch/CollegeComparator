//
//  BarViewController.swift
//  Playground
//
//  Created by christopher conyersIV on 12/8/23.
//

import Charts
import UIKit

class BarViewController: UIViewController, ChartViewDelegate, AxisValueFormatter {
    
    var programs = [String]()
    var earn = [Double]()
    
    func stringForValue(_ value: Double, axis: Charts.AxisBase?) -> String {
        let prog = programs[Int(value)]
        //print(prog)
        return prog
    }
    
    var school: Schools?
    
    var earnings:[Earnings] = []
    
    var barChart = BarChartView()
    
    weak var axisFormatDelegate: AxisValueFormatter?

    override func viewDidLoad() {
        
        super.viewDidLoad()
        barChart.delegate = self
        axisFormatDelegate = self

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        
        guard school != nil else {
            return
        }
        
        earnings = school!.earnings!
        
        super.viewDidLayoutSubviews()
        
        barChart.frame = CGRect(x: 0, y: 200, width: self.view.frame.size.width, height: self.view.frame.size.height - 300)
        
        barChart.center = view.center
        
        barChart.xAxis.labelPosition = XAxis.LabelPosition.bottom
        
        barChart.xAxis.wordWrapEnabled = true
        
        barChart.xAxis.labelWidth = 22
        
        barChart.extraBottomOffset = CGFloat(60.0)
        
        barChart.xAxis.labelFont = UIFont(name: "Verdana", size: 8.0)!
        
        barChart.leftAxis.enabled = false
        
        barChart.legend.enabled = false
        
        barChart.drawGridBackgroundEnabled = false
        
        barChart.xAxis.drawGridLinesEnabled = false
        
        barChart.leftAxis.drawGridLinesEnabled = false
        
        barChart.rightAxis.drawGridLinesEnabled = false
        
        view.addSubview(barChart)
        
        earnings = earnings.sorted { $0.med_earnings! > $1.med_earnings! }
        
        for i in 0..<6 {
            programs.append(earnings[i].title!)
            earn.append(Double(earnings[i].med_earnings!))
            
        }
        
        setChart(dataEntryX: programs, dataEntryY: earn)
        
        barChart.fitScreen()
    }
    
    func setChart(dataEntryX forX:[String],dataEntryY forY: [Double]) {
        
            //viewForChart.noDataText = "You need to provide data for the chart."
            
        var dataEntries:[BarChartDataEntry] = []
        
            for i in 0..<forX.count{
                
                let dataEntry = BarChartDataEntry(x: Double(i), y: Double(forY[i]) , data: programs as AnyObject?)
                
                //print(dataEntry)
                
                dataEntries.append(dataEntry)
            }
            let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Program")
        
            let chartData = BarChartData(dataSet: chartDataSet)
        
            barChart.data = chartData
        
            let xAxisValue = barChart.xAxis
        
            xAxisValue.valueFormatter = axisFormatDelegate
        
        }
}
