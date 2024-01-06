//
//  HealthTableViewCell.swift
//  CollegeComparator
//
//  Created by christopher conyersIV on 1/5/24.
//

import UIKit
import Charts

class HealthTableViewCell: UITableViewCell, ChartViewDelegate, AxisValueFormatter {
    
    var programs = [String]()
    var percents = [Double]()
    
    @IBOutlet weak var HealthChart: BarChartView!
    
    func stringForValue(_ value: Double, axis: Charts.AxisBase?) -> String {
        let prog = programs[Int(value)]
        //print(prog)
        return prog
    }
    

    weak var axisFormatDelegate: AxisValueFormatter?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        HealthChart.delegate = self
        axisFormatDelegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(schools:[String], healthPercent:[Double]) {
        
        programs = schools
        percents = healthPercent
        
        guard schools.count == 6 else {
            return
        }
        
        var dataEntries:[BarChartDataEntry] = []
        
        HealthChart.noDataText = "No data"
        
        for i in 0..<6{
                
            let dataEntry = BarChartDataEntry(x: Double(i), y: Double(healthPercent[i]))
                
                //print(dataEntry)
                
                dataEntries.append(dataEntry)
            }
        
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Percent Business Majors")
        
        let chartData = BarChartData(dataSet: chartDataSet)
        
        HealthChart.data = chartData
        
        let xAxisValue = HealthChart.xAxis
        
        xAxisValue.valueFormatter = axisFormatDelegate
        
        HealthChart.notifyDataSetChanged()
        
        HealthChart.frame = CGRect(x: 0, y: 0, width: 380, height: 300)
        
        HealthChart.xAxis.labelPosition = XAxis.LabelPosition.bottom
        
        HealthChart.xAxis.wordWrapEnabled = true
        
        HealthChart.xAxis.labelWidth = 22
        
        HealthChart.extraBottomOffset = CGFloat(60.0)
        
        HealthChart.xAxis.labelFont = UIFont(name: "Verdana", size: 7.0)!
        
        HealthChart.leftAxis.enabled = false
        
        HealthChart.legend.enabled = true
        
        HealthChart.drawGridBackgroundEnabled = false
        
        HealthChart.xAxis.drawGridLinesEnabled = false
        
        HealthChart.leftAxis.drawGridLinesEnabled = false
        
        HealthChart.rightAxis.drawGridLinesEnabled = false
        
        HealthChart.legend.horizontalAlignment = .center
        
        HealthChart.legend.verticalAlignment = .top
        
        self.setSelected(false, animated: false)
        
    }

}


