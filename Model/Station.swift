//
//  Station.swift
//  Tube Picker
//
//  Created by Benjamin Groom on 11/09/2022.
//

import Foundation

struct Station: Hashable, Comparable {
    
    let name: String
    let mode: StopPointMetaData.modeName
    let naptanID: String?
    
    static let `default` = Station(name: "Paddington Underground Station", mode: StopPointMetaData.modeName.tube, naptanID: nil)

    static func < (lhs: Station, rhs: Station) -> Bool {
        return lhs.name < rhs.name
    }
    
    static func ==(lhs: Station, rhs: Station) -> Bool {
        return lhs.getReadableName() == rhs.getReadableName()
    }

    func getReadableName() -> String {
        return BlacklistedStationTermStripper.removeBlacklistedTerms(input: name)
    }
    
}
