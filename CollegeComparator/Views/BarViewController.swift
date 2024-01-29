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
        
        barChart.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 700)
        
        barChart.center = view.center
        
        barChart.extraTopOffset = 100.0
        
        barChart.xAxis.labelPosition = XAxis.LabelPosition.bottom
        
        barChart.xAxis.wordWrapEnabled = true
        
        barChart.xAxis.labelWidth = 22
        
        barChart.rightAxis.spaceBottom = 0.0
        
        barChart.xAxis.yOffset = 0.0
        
        barChart.extraBottomOffset = CGFloat(60.0)
        
        barChart.xAxis.labelFont = UIFont(name: "Verdana", size: 8.0)!
        
        barChart.leftAxis.enabled = false
        
        // barChart.xAxis.drawAxisLineEnabled = false
        
        barChart.legend.enabled = true
        
        barChart.legend.horizontalAlignment = .center
        
        barChart.legend.verticalAlignment = .bottom
        
        barChart.legend.yOffset = 25.0
        
        barChart.legend.xOffset = 22.0
        
        barChart.legend.orientation = .horizontal
        
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
        
        var dataEntries2:[BarChartDataEntry] = []
        
        for i in 0..<3{
                
            let dataEntry = BarChartDataEntry(x: Double(i), y: Double(forY[i]) , data: programs as AnyObject?)
                
                //print(dataEntry)
                
            dataEntries.append(dataEntry)
        }
        
        for i in 3..<6{
            
            let dataEntry = BarChartDataEntry(x: Double(i), y: Double(forY[i]) , data: programs as AnyObject?)
            
            //print(dataEntry)
            
            dataEntries2.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "6 Year Earnings Distribution")
        
        chartDataSet.setColor(.purple)
        
        chartDataSet.axisDependency = .right
        
        let chartDataSet2 = BarChartDataSet(entries: dataEntries2, label: "10 Year Earnings Distribution")
        
        chartDataSet2.setColor(.blue)
        
        chartDataSet2.axisDependency = .right
        
        let chartData = BarChartData(dataSets: [chartDataSet, chartDataSet2])
        
        barChart.data = chartData
        
        let xAxisValue = barChart.xAxis
        
        xAxisValue.valueFormatter = axisFormatDelegate
        
        }
}
