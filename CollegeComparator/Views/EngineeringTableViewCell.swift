//
//  EngineeringTableViewCell.swift
//  CollegeComparator
//
//  Created by christopher conyersIV on 12/26/23.
//

import UIKit
import Charts

class EngineeringTableViewCell: UITableViewCell, ChartViewDelegate, AxisValueFormatter {
    
    var programs = [String]()
    
    var percents = [Double]()
    
    @IBOutlet weak var EngineeringChart: BarChartView!
    
    func stringForValue(_ value: Double, axis: Charts.AxisBase?) -> String {
        
        let prog = programs[Int(value)]
        
        return prog
    }
    

    weak var axisFormatDelegate: AxisValueFormatter?
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
        
        EngineeringChart.delegate = self
        
        axisFormatDelegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(schools:[String], engineeringPercent:[Double]) {
        
        programs = schools
        
        percents = engineeringPercent
        
        guard schools.count == 6 else {
            return
        }
        
        var dataEntries:[BarChartDataEntry] = []
        
        EngineeringChart.noDataText = "No data"
        
        for i in 0..<6{
                
            let dataEntry = BarChartDataEntry(x: Double(i), y: Double(engineeringPercent[i]))
                
                //print(dataEntry)
                
                dataEntries.append(dataEntry)
            }
        
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Percent Engineering Majors")
        
        chartDataSet.setColor(.purple)
        
        let chartData = BarChartData(dataSet: chartDataSet)
        
        EngineeringChart.data = chartData
        
        let xAxisValue = EngineeringChart.xAxis
        
        xAxisValue.valueFormatter = axisFormatDelegate
        
        EngineeringChart.notifyDataSetChanged()
        
        EngineeringChart.frame = CGRect(x: 0, y: 0, width: 380, height: 300)
        
        EngineeringChart.xAxis.labelPosition = XAxis.LabelPosition.bottom
        
        EngineeringChart.xAxis.wordWrapEnabled = true
        
        EngineeringChart.xAxis.labelWidth = 22
        
        EngineeringChart.extraBottomOffset = CGFloat(60.0)
        
        EngineeringChart.xAxis.labelFont = UIFont(name: "Verdana", size: 7.0)!
        
        EngineeringChart.leftAxis.enabled = false
        
        EngineeringChart.legend.enabled = true
        
        EngineeringChart.drawGridBackgroundEnabled = false
        
        EngineeringChart.xAxis.drawGridLinesEnabled = false
        
        EngineeringChart.leftAxis.drawGridLinesEnabled = false
        
        EngineeringChart.rightAxis.drawGridLinesEnabled = false
        
        EngineeringChart.legend.horizontalAlignment = .center
        
        EngineeringChart.legend.verticalAlignment = .top
        
        self.setSelected(false, animated: false)
        
    }

}

