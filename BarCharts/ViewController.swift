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
        return dataDates[Int(value)].toDateString()
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
        let barWidth = 0.1
        var barDataCases: [BarChartDataEntry] = []
        var barDataDeaths: [BarChartDataEntry] = []
        var barDataRecovered: [BarChartDataEntry] = []

        for i in 0..<dataDates.count {
            barDataCases.append(BarChartDataEntry(x: Double(i) - (barWidth + 0.1), y: Double.random(in: 100..<1000)))
            barDataDeaths.append(BarChartDataEntry(x: Double(i), y: Double.random(in: 100..<1000)))
            barDataRecovered.append(BarChartDataEntry(x: Double(i) + (barWidth + 0.1), y: Double.random(in: 100..<1000)))
        }

        let barSetCases = BarChartDataSet(entries: barDataCases, label: "Caess")
        let barSetDeaths = BarChartDataSet(entries: barDataDeaths, label: "Deaths")
        let barSetRecovered = BarChartDataSet(entries: barDataRecovered, label: "Recovered")

        let barData = BarChartData(dataSets: [barSetCases, barSetDeaths, barSetRecovered])
        barData.barWidth = barWidth
        barChartView.data = barData
    }

    @IBAction func btnLoadDataTapped(_ sender: Any) {
        laodData()
    }
}
