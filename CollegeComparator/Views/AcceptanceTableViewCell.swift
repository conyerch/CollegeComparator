//
//  AcceptanceTableViewCell.swift
//  CollegeComparator
//
//  Created by christopher conyersIV on 12/23/23.
//

import UIKit
import Charts

class AcceptanceTableViewCell: UITableViewCell, ChartViewDelegate, AxisValueFormatter {
    
    func stringForValue(_ value: Double, axis: Charts.AxisBase?) -> String {
        let prog = programs[Int(value)]
        //print(prog)
        return prog
    }
    
    var programs = [String]()
    var acceptances = [Double]()
    
    @IBOutlet weak var AcceptanceChart: BarChartView!
    
    weak var axisFormatDelegate: AxisValueFormatter?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(schools:[String], acceptance:[Double]) {
        
        programs = schools
        acceptances = acceptance
        
        guard schools.count == 6 else {
            return
        }
        
        var dataEntries:[BarChartDataEntry] = []
        
        AcceptanceChart.noDataText = "No data"
        
        for i in 0..<6{
                
            let dataEntry = BarChartDataEntry(x: Double(i), y: Double(acceptance[i]))
                
                //print(dataEntry)
                
                dataEntries.append(dataEntry)
            }
        
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Program")
        
        let chartData = BarChartData(dataSet: chartDataSet)
        
        AcceptanceChart.data = chartData
        
        let xAxisValue = AcceptanceChart.xAxis
        
        xAxisValue.valueFormatter = axisFormatDelegate
        
        AcceptanceChart.notifyDataSetChanged()
        
        AcceptanceChart.frame = CGRect(x: 0, y: 0, width: 380, height: 200)
        
        AcceptanceChart.xAxis.labelPosition = XAxis.LabelPosition.bottom
        
        AcceptanceChart.xAxis.wordWrapEnabled = true
        
        AcceptanceChart.xAxis.labelWidth = 22
        
        AcceptanceChart.extraBottomOffset = CGFloat(60.0)
        
        AcceptanceChart.xAxis.labelFont = UIFont(name: "Verdana", size: 8.0)!
        
        AcceptanceChart.leftAxis.enabled = false
        
        AcceptanceChart.legend.enabled = false
        
        AcceptanceChart.drawGridBackgroundEnabled = false
        
        AcceptanceChart.xAxis.drawGridLinesEnabled = false
        
        AcceptanceChart.leftAxis.drawGridLinesEnabled = false
        
        AcceptanceChart.rightAxis.drawGridLinesEnabled = false
        
        self.setSelected(false, animated: false)
        
    }

}
