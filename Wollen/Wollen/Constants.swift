//
//  Constants.swift
//  Wollen
//
//  Created by José Henrique Fernandes Silva on 05/08/21.
//

import Foundation

public func WeeksToSeconds(_ weeks: Double) -> Double {
    return weeks * 604800
}

public func MonthsToSeconds(_ months: Double) -> Double {
    return months * WeeksToSeconds(4)
}

public func YearsToSeconds(_ years: Double) -> Double {
    return years * MonthsToSeconds(12)
}


