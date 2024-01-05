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
        
        super.viewDidLayoutSubviews()
        
        barChart.frame = CGRect(x: 0, y: 100, width: self.view.frame.size.width, height: self.view.frame.size.height - 250)
        
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
        
        
        programs.append("25th Percentile 6 Years")
        earn.append(Double(school!.quar_6yr!))
        
        programs.append("Median 6 Years")
        earn.append(Double(school!.med_6yr!))
        
        programs.append("75th Percentile 6 Years")
        earn.append(Double(school!.thir_6yr!))
        
        programs.append("25th Percentile 10 Years")
        earn.append(Double(school!.quar_10yr!))
        
        programs.append("Median 10 Years")
        earn.append(Double(school!.med_10yr!))
        
        programs.append("75th Percentile 10 Years")
        earn.append(Double(school!.thir_10yr!))
            
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
