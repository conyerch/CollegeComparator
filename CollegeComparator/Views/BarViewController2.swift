//
//  BarViewController2.swift
//  Playground
//
//  Created by christopher conyersIV on 12/18/23.
//

import Charts
import UIKit

class BarViewController2: UIViewController, ChartViewDelegate, AxisValueFormatter {
    
    var programs = [String]()
    var percs = [Double]()
    
    func stringForValue(_ value: Double, axis: Charts.AxisBase?) -> String {
        
        let prog = programs[Int(value)]
        
        return prog
    }
    
    var school: Schools?
    
    var percentages:[(name:String, percent:Double)] = []
    
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
        
        percentages = school!.percentages
        
        super.viewDidLayoutSubviews()
        
        barChart.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 700)
        
        barChart.center = view.center
        
        barChart.extraTopOffset = 100.0
        
        barChart.xAxis.labelPosition = XAxis.LabelPosition.bottom
        
        barChart.xAxis.wordWrapEnabled = true
        
        barChart.xAxis.labelWidth = 22
        
        barChart.leftAxis.axisMinimum = 0
        
        barChart.extraBottomOffset = CGFloat(60.0)
        
        //barChart.rightAxis.spaceBottom = 0.0
        
        barChart.xAxis.labelFont = UIFont(name: "Verdana", size: 8.0)!
        
        barChart.leftAxis.enabled = false
        
        barChart.legend.enabled = false
        
        barChart.drawGridBackgroundEnabled = false
        
        barChart.xAxis.drawGridLinesEnabled = false
        
        barChart.leftAxis.drawGridLinesEnabled = false
        
        barChart.rightAxis.drawGridLinesEnabled = false
        
        view.addSubview(barChart)
        
        self.percentages = self.percentages.sorted(by: {$0.percent > $1.percent})
        
        for i in 0..<6 {
            
            let (title, perc) = percentages[i]
            
            programs.append(title)
            
            percs.append(perc)
            
        }
        
        setChart(dataEntryX: programs, dataEntryY: percs)
        
        barChart.fitScreen()
        
    }
    
    func setChart(dataEntryX forX:[String],dataEntryY forY: [Double]) {
        
            //viewForChart.noDataText = "You need to provide data for the chart."
            
        var dataEntries:[BarChartDataEntry] = []
        
        for i in 0..<forX.count{
                
                let dataEntry = BarChartDataEntry(x: Double(i), y: Double(forY[i]) , data: programs as AnyObject?)
                
                dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Program")
        
        chartDataSet.setColor(.purple)
        
        let chartData = BarChartData(dataSet: chartDataSet)
        
        barChart.data = chartData
        
        let xAxisValue = barChart.xAxis
        
        xAxisValue.valueFormatter = axisFormatDelegate
        
        }
}
