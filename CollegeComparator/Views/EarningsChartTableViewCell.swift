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
        return String(describing: value)
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
        
        var dataEntries:[BarChartDataEntry] = []
        
        Earnings_10yr.noDataText = "No data"
        
        for i in 0..<6{
                
            let dataEntry = BarChartDataEntry(x: Double(i), y: Double(i))
                
                //print(dataEntry)
                
                dataEntries.append(dataEntry)
            }
        
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Program")
        
        let chartData = BarChartData(dataSet: chartDataSet)
        
        Earnings_10yr.data = chartData
        
        print(Earnings_10yr.data!.entryCount)
        
        let xAxisValue = Earnings_10yr.xAxis
        
        xAxisValue.valueFormatter = axisFormatDelegate
        
        Earnings_10yr.notifyDataSetChanged()
        
        print(Earnings_10yr.data!.entryCount)
        
    }

}
