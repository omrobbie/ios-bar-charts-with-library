//
//  DateFormatter.swift
//  BarCharts
//
//  Created by omrobbie on 28/05/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import Foundation

extension String {

    func toDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy"
        return dateFormatter.date(from: self) ?? nil
    }

    func toDateString() -> String {
        guard let date = self.toDate() else {return ""}
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM"
        return dateFormatter.string(from: date)
    }
}
