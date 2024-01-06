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
        //print(value)
        let prog = programs[Int(value)]
        //print(prog)
        return prog
    }
    
    @IBOutlet weak var Earnings_10yr: BarChartView!
    
    @IBOutlet weak var EarningsText: UITextView!
    
    weak var axisFormatDelegate: AxisValueFormatter?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        Earnings_10yr.delegate = self
        axisFormatDelegate = self
        EarningsText.text = "Highest Median Earnings 10 Years After Graduation"
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(schools:[String], earnings:[Double]) {
        
        self.programs = schools
        
        self.earn = earnings
        
        //print(schools)
        
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
        
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Highest Median 10 Year Earnings")
        
        let chartData = BarChartData(dataSet: chartDataSet)
        
        Earnings_10yr.data = chartData
        
        let xAxisValue = Earnings_10yr.xAxis
        
        xAxisValue.valueFormatter = axisFormatDelegate
        
        Earnings_10yr.notifyDataSetChanged()
        
        Earnings_10yr.frame = CGRect(x: 0, y: 0, width: 380, height: 300)
        
        Earnings_10yr.xAxis.labelPosition = XAxis.LabelPosition.bottom
        
        Earnings_10yr.xAxis.wordWrapEnabled = true
        
        Earnings_10yr.xAxis.labelWidth = 16
        
        Earnings_10yr.extraBottomOffset = CGFloat(60.0)
        
        Earnings_10yr.xAxis.labelFont = UIFont(name: "Verdana", size: 7.0)!
        
        Earnings_10yr.leftAxis.enabled = false
        
        Earnings_10yr.legend.enabled = true
        
        Earnings_10yr.drawGridBackgroundEnabled = false
        
        Earnings_10yr.xAxis.drawGridLinesEnabled = false
        
        Earnings_10yr.leftAxis.drawGridLinesEnabled = false
        
        Earnings_10yr.rightAxis.drawGridLinesEnabled = false
        
        Earnings_10yr.legend.horizontalAlignment = .center
        
        Earnings_10yr.legend.verticalAlignment = .top
        
        self.setSelected(false, animated: false)
        
    }

}
