//
//  ConfigurationAppIntent.swift
//  widget2Extension
//
//  Created by Steven Kideckel on 2023-10-18.
//  Copyright © 2023 orgName. All rights reserved.
//

import AppIntents
import WidgetKit
import SwiftUI
import ComposeApp

enum StationChoice : String, AppEnum {
    case exp, grove, harrison, hoboken, jsq, newark, newport, christopher, ninth, fourteenth, twentyThird, thirtyThird, wtc
    
    static var typeDisplayRepresentation: TypeDisplayRepresentation = "Station Choice"
    
    static var caseDisplayRepresentations: [StationChoice : DisplayRepresentation] = [
        .exp: "Exchange Place",
        .grove: "Grove Street",
        .harrison: "Harrison",
        .hoboken: "Hoboken",
        .jsq: "Journal Square",
        .newark: "Newark",
        .newport: "Newport",
        .christopher: "Christopher Street",
        .ninth: "9th Street",
        .fourteenth: "14th Street",
        .twentyThird: "23rd Street",
        .thirtyThird: "33rd Street",
        .wtc: "World Trade Center"
    ]
}

enum SortOrder : String, AppEnum {
    case alphabetical, njAm, nyAm
    
    static var typeDisplayRepresentation: TypeDisplayRepresentation = "Order"
    
    static var caseDisplayRepresentations: [SortOrder : DisplayRepresentation] = [
        .alphabetical: "A-Z",
        .njAm: "NJ morning, NY evening",
        .nyAm: "NY morning, NJ evening"
    ]
    
}

enum Filter : String, AppEnum {
    case all, interstate
    
    static var typeDisplayRepresentation: TypeDisplayRepresentation = "Filter"
    
    static var caseDisplayRepresentations: [Filter : DisplayRepresentation] = [
        .all: "All trains",
        .interstate: "Only interstate trains"
    ]
    
}

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Departure board for PATH"
    static var description = IntentDescription("Departure board for PATH trains")
    
    @Parameter(title: "Stations", default: [])
    var stations: [StationChoice]
    
    @Parameter(title: "Order", default: SortOrder.alphabetical)
    var sortOrder: SortOrder
    
    @Parameter(title: "Filter", default: Filter.all)
    var filter: Filter
    
    init() {
        self.stations = []
        self.sortOrder = .alphabetical
        self.filter = .all
    }
    
    init(stations: [StationChoice] = [], sortOrder: SortOrder = .alphabetical, filter: Filter = .all) {
        self.stations = stations
        self.sortOrder = sortOrder
        self.filter = filter
    }
}
