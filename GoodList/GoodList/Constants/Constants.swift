//
//  Constants.swift
//  GoodList
//
//  Created by Joobang on 2023/04/18.
//

import Foundation

enum SegmentItem: String, CaseIterable{
    case all = "All"
    case high = "High"
    case medium = "Medium"
    case low = "Low"
}

struct Constants {
    let identifier = "Cell"
    let mainTitle = "Good List"
    let addTaskTitle = "Add Task"
    
    let autolayout = AutolayoutConstants()
    
    struct AutolayoutConstants {
        let segmentTop: CGFloat = 20
        let segmentHorizon: CGFloat = 20
        let tableviewTop: CGFloat = 30
        let textfieldSpace: CGFloat = 100
        let textfieldHeight: CGFloat = 30
        let textfieldHorizon: CGFloat = 20
    }
}
