//
//  SatMathTableViewCell.swift
//  CollegeComparator
//
//  Created by christopher conyersIV on 12/26/23.
//

import UIKit
import Charts

class SatMathTableViewCell: UITableViewCell, ChartViewDelegate, AxisValueFormatter {
    
    var programs = [String]()
    var scores = [Double]()
    
    func stringForValue(_ value: Double, axis: Charts.AxisBase?) -> String {
        let prog = programs[Int(value)]
        //print(prog)
        return prog
    }
    
    @IBOutlet weak var ScoreChart: BarChartView!
    
    weak var axisFormatDelegate: AxisValueFormatter?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ScoreChart.delegate = self
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
        
        ScoreChart.noDataText = "No data"
        
        for i in 0..<6{
                
            let dataEntry = BarChartDataEntry(x: Double(i), y: Double(mathScores[i]))
                
                //print(dataEntry)
                
                dataEntries.append(dataEntry)
            }
        
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Top Quartile SAT Math Score Threshold")
        
        let chartData = BarChartData(dataSet: chartDataSet)
        
        ScoreChart.data = chartData
        
        let xAxisValue = ScoreChart.xAxis
        
        xAxisValue.valueFormatter = axisFormatDelegate
        
        ScoreChart.notifyDataSetChanged()
        
        ScoreChart.frame = CGRect(x: 0, y: 0, width: 380, height: 300)
        
        ScoreChart.xAxis.labelPosition = XAxis.LabelPosition.bottom
        
        ScoreChart.xAxis.wordWrapEnabled = true
        
        ScoreChart.xAxis.labelWidth = 22
        
        ScoreChart.extraBottomOffset = CGFloat(60.0)
        
        ScoreChart.xAxis.labelFont = UIFont(name: "Verdana", size: 7.0)!
        
        ScoreChart.leftAxis.enabled = false
        
        ScoreChart.legend.enabled = true
        
        ScoreChart.drawGridBackgroundEnabled = false
        
        ScoreChart.xAxis.drawGridLinesEnabled = false
        
        ScoreChart.leftAxis.drawGridLinesEnabled = false
        
        ScoreChart.rightAxis.drawGridLinesEnabled = false
        
        ScoreChart.legend.horizontalAlignment = .center
        
        ScoreChart.legend.verticalAlignment = .top
        
        self.setSelected(false, animated: false)
        
    }

}

