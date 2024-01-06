//
//  CompSciTableViewCell.swift
//  CollegeComparator
//
//  Created by christopher conyersIV on 12/26/23.
//

import UIKit
import Charts

class CompSciTableViewCell: UITableViewCell, ChartViewDelegate, AxisValueFormatter {
    
    var programs = [String]()
    var percents = [Double]()
    
    @IBOutlet weak var CompSciChart: BarChartView!
    
    func stringForValue(_ value: Double, axis: Charts.AxisBase?) -> String {
        let prog = programs[Int(value)]
        //print(prog)
        return prog
    }
    

    weak var axisFormatDelegate: AxisValueFormatter?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        CompSciChart.delegate = self
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
        
        CompSciChart.noDataText = "No data"
        
        for i in 0..<6{
                
            let dataEntry = BarChartDataEntry(x: Double(i), y: Double(engineeringPercent[i]))
                
                //print(dataEntry)
                
                dataEntries.append(dataEntry)
            }
        
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Percent Computer Science Majors")
        
        chartDataSet.setColor(.blue)
        
        let chartData = BarChartData(dataSet: chartDataSet)
        
        CompSciChart.data = chartData
        
        let xAxisValue = CompSciChart.xAxis
        
        xAxisValue.valueFormatter = axisFormatDelegate
        
        CompSciChart.notifyDataSetChanged()
        
        CompSciChart.frame = CGRect(x: 0, y: 0, width: 380, height: 300)
        
        CompSciChart.xAxis.labelPosition = XAxis.LabelPosition.bottom
        
        CompSciChart.xAxis.wordWrapEnabled = true
        
        CompSciChart.xAxis.labelWidth = 22
        
        CompSciChart.extraBottomOffset = CGFloat(60.0)
        
        CompSciChart.xAxis.labelFont = UIFont(name: "Verdana", size: 7.0)!
        
        CompSciChart.leftAxis.enabled = false
        
        CompSciChart.legend.enabled = true
        
        CompSciChart.drawGridBackgroundEnabled = false
        
        CompSciChart.xAxis.drawGridLinesEnabled = false
        
        CompSciChart.leftAxis.drawGridLinesEnabled = false
        
        CompSciChart.rightAxis.drawGridLinesEnabled = false
        
        CompSciChart.legend.horizontalAlignment = .center
        
        CompSciChart.legend.verticalAlignment = .top
        
        self.setSelected(false, animated: false)
        
    }

}
