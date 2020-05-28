//
//  ViewController.swift
//  BarCharts
//
//  Created by omrobbie on 28/05/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit
import Charts

class XAxisValueFormatter: IAxisValueFormatter {

    let dataDates: [String]

    init(datadates: [String]) {
        self.dataDates = datadates
    }

    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return dataDates[Int(value)]
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var barChartView: BarChartView!

    let dataDates: [String] = [
        "5/20/20",
        "5/21/20",
        "5/22/20",
        "5/23/20",
        "5/24/20",
        "5/25/20",
        "5/26/20",
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBarChartView()
    }

    func setupBarChartView() {
        barChartView.backgroundColor = .systemGray6
        barChartView.rightAxis.enabled = false
        barChartView.xAxis.labelPosition = .bottom
        barChartView.xAxis.valueFormatter = XAxisValueFormatter(datadates: dataDates)
    }

    func laodData() {
        var barDataEntry: [BarChartDataEntry] = []

        for i in 0..<dataDates.count {
            barDataEntry.append(BarChartDataEntry(x: Double(i), y: Double.random(in: 100..<1000)))
        }

        let barSet = BarChartDataSet(entries: barDataEntry, label: "Data")
        let barData = BarChartData(dataSets: [barSet])
        barChartView.data = barData
    }

    @IBAction func btnLoadDataTapped(_ sender: Any) {
        laodData()
    }
}
