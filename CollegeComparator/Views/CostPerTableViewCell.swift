//
//  CostPerTableViewCell.swift
//  CollegeComparator
//
//  Created by christopher conyersIV on 12/23/23.
//

import UIKit
import Charts

class CostPerTableViewCell: UITableViewCell, ChartViewDelegate, AxisValueFormatter {
    
    var programs = [String]()
    var costper = [Double]()
    
    @IBOutlet weak var CostPerChart: BarChartView!
    
    weak var axisFormatDelegate: AxisValueFormatter?
    
    func stringForValue(_ value: Double, axis: Charts.AxisBase?) -> String {
        let prog = programs[Int(value)]
        //print(prog)
        return prog
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        CostPerChart.delegate = self
        axisFormatDelegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(schools:[String], cp:[Double]) {
        
        programs = schools
        costper = cp
        
        guard schools.count == 6 else {
            return
        }
        
        var dataEntries:[BarChartDataEntry] = []
        
        CostPerChart.noDataText = "No data"
        
        for i in 0..<6{
                
            let dataEntry = BarChartDataEntry(x: Double(i), y: Double(cp[i]))
                
                //print(dataEntry)
                
                dataEntries.append(dataEntry)
            }
        
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Highest Median Yearly Earnings Per Tuition Cost")
        
        let chartData = BarChartData(dataSet: chartDataSet)
        
        CostPerChart.data = chartData
        
        let xAxisValue = CostPerChart.xAxis
        
        xAxisValue.valueFormatter = axisFormatDelegate
        
        CostPerChart.notifyDataSetChanged()
        
        CostPerChart.frame = CGRect(x: 0, y: 0, width: 380, height: 300)
        
        CostPerChart.xAxis.labelPosition = XAxis.LabelPosition.bottom
        
        CostPerChart.xAxis.wordWrapEnabled = true
        
        CostPerChart.xAxis.labelWidth = 22
        
        CostPerChart.extraBottomOffset = CGFloat(60.0)
        
        CostPerChart.xAxis.labelFont = UIFont(name: "Verdana", size: 7.0)!
        
        CostPerChart.leftAxis.enabled = false
        
        CostPerChart.legend.enabled = true
        
        CostPerChart.drawGridBackgroundEnabled = false
        
        CostPerChart.xAxis.drawGridLinesEnabled = false
        
        CostPerChart.leftAxis.drawGridLinesEnabled = false
        
        CostPerChart.rightAxis.drawGridLinesEnabled = false
        
        CostPerChart.legend.horizontalAlignment = .center
        
        CostPerChart.legend.verticalAlignment = .top
        
        CostPerChart.legend.wordWrapEnabled = true
        
        self.setSelected(false, animated: false)
        
    }

}
