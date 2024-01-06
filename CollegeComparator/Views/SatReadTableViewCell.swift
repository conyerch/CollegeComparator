//
//  SatReadTableViewCell.swift
//  CollegeComparator
//
//  Created by christopher conyersIV on 12/26/23.
//

import UIKit
import Charts

class SatReadTableViewCell: UITableViewCell, ChartViewDelegate, AxisValueFormatter {
    
    var programs = [String]()
    var scores = [Double]()
    
    @IBOutlet weak var readChart: BarChartView!
    
    func stringForValue(_ value: Double, axis: Charts.AxisBase?) -> String {
        let prog = programs[Int(value)]
        //print(prog)
        return prog
    }
    
    weak var axisFormatDelegate: AxisValueFormatter?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        readChart.delegate = self
        axisFormatDelegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(schools:[String], mathScores:[Double]) {
        
        programs = schools
        scores = mathScores
        
        guard schools.count == 6 else {
            return
        }
        
        var dataEntries:[BarChartDataEntry] = []
        
        readChart.noDataText = "No data"
        
        for i in 0..<6{
                
            let dataEntry = BarChartDataEntry(x: Double(i), y: Double(mathScores[i]))
                
                //print(dataEntry)
                
                dataEntries.append(dataEntry)
            }
        
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Top Quartile SAT Reading Score Threshold")
        
        let chartData = BarChartData(dataSet: chartDataSet)
        
        readChart.data = chartData
        
        let xAxisValue = readChart.xAxis
        
        xAxisValue.valueFormatter = axisFormatDelegate
        
        readChart.notifyDataSetChanged()
        
        readChart.frame = CGRect(x: 0, y: 0, width: 380, height: 300)
        
        readChart.xAxis.labelPosition = XAxis.LabelPosition.bottom
        
        readChart.xAxis.wordWrapEnabled = true
        
        readChart.xAxis.labelWidth = 22
        
        readChart.extraBottomOffset = CGFloat(60.0)
        
        readChart.xAxis.labelFont = UIFont(name: "Verdana", size: 7.0)!
        
        readChart.leftAxis.enabled = false
        
        readChart.legend.enabled = true
        
        readChart.drawGridBackgroundEnabled = false
        
        readChart.xAxis.drawGridLinesEnabled = false
        
        readChart.leftAxis.drawGridLinesEnabled = false
        
        readChart.rightAxis.drawGridLinesEnabled = false
        
        readChart.legend.horizontalAlignment = .center
        
        readChart.legend.verticalAlignment = .top
        
        self.setSelected(false, animated: false)
        
    }

}
