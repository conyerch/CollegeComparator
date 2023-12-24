//
//  EarningsChartTableViewCell.swift
//  CollegeComparator
//
//  Created by christopher conyersIV on 12/23/23.
//

import UIKit
import Charts

class EarningsChartTableViewCell: UITableViewCell, ChartViewDelegate, AxisValueFormatter {
    
    var programs = [String]()
    var earn = [Double]()
    
    func stringForValue(_ value: Double, axis: Charts.AxisBase?) -> String {
        let prog = programs[Int(value)]
        //print(prog)
        return prog
    }
    
    @IBOutlet weak var Earnings_10yr: BarChartView!
    
    weak var axisFormatDelegate: AxisValueFormatter?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        Earnings_10yr.delegate = self
        axisFormatDelegate = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(schools:[String], earnings:[Double]) {
        
        programs = schools
        earn = earnings
        
        guard schools.count == 6 else {
            return
        }
        
        var dataEntries:[BarChartDataEntry] = []
        
        Earnings_10yr.noDataText = "No data"
        
        for i in 0..<6{
                
            let dataEntry = BarChartDataEntry(x: Double(i), y: Double(earnings[i]))
                
                //print(dataEntry)
                
                dataEntries.append(dataEntry)
            }
        
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Program")
        
        let chartData = BarChartData(dataSet: chartDataSet)
        
        Earnings_10yr.data = chartData
        
        let xAxisValue = Earnings_10yr.xAxis
        
        xAxisValue.valueFormatter = axisFormatDelegate
        
        Earnings_10yr.notifyDataSetChanged()
        
        Earnings_10yr.frame = CGRect(x: 0, y: 0, width: 380, height: 200)
        
        Earnings_10yr.xAxis.labelPosition = XAxis.LabelPosition.bottom
        
        Earnings_10yr.xAxis.wordWrapEnabled = true
        
        Earnings_10yr.xAxis.labelWidth = 22
        
        Earnings_10yr.extraBottomOffset = CGFloat(60.0)
        
        Earnings_10yr.xAxis.labelFont = UIFont(name: "Verdana", size: 8.0)!
        
        Earnings_10yr.leftAxis.enabled = false
        
        Earnings_10yr.legend.enabled = false
        
        Earnings_10yr.drawGridBackgroundEnabled = false
        
        Earnings_10yr.xAxis.drawGridLinesEnabled = false
        
        Earnings_10yr.leftAxis.drawGridLinesEnabled = false
        
        Earnings_10yr.rightAxis.drawGridLinesEnabled = false
        
        self.setSelected(false, animated: false)
        
    }

}
