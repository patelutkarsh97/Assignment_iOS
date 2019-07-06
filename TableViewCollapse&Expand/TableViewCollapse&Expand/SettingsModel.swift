//
//  Model.swift
//  TableViewCollapse&Expand
//
//  Created by Utkarsh Patel on 26/06/19.
//  Copyright © 2019 Utkarsh Patel. All rights reserved.
//

import Foundation

public enum CellType: String {
    case radioCell
    case subTitleCell
    case switchCell
    case labelCell
}

public enum SettingsSection: Int {
    case ChangePassword = 0
    case ChangeParentalLock = 1
    case DeviceSettings
    case StreamingQuality
    case DownloadQuality
    case NotificationControls
    case RateThisApp
    case RefreshAccount
    case LogOut
}


public struct Item {
    var name: String
    var isSelected: Bool
    var cellType: CellType
    public init(name: String, isSelected: Bool, cellType: CellType) {
        self.name = name
        self.isSelected = isSelected
        self.cellType = cellType
    }
}

public struct Section {
    var name: String
    var items: [Item]?
    var isExpandable: Bool
    
    public init(name: String, items: [Item]? = nil, isExpandable: Bool = false) {
        self.name = name
        self.items = items
        self.isExpandable = isExpandable
    }
}

public var sectionData: [Section] = [
    Section(name: "Change Password", items: nil),
    Section(name: "Change Parental Lock", items: nil),
    Section(name: "Device Settings", items: [
        Item(name: "Pair Device To STB", isSelected: false, cellType: CellType.labelCell),
        Item(name: "Device Management", isSelected: false, cellType: CellType.labelCell)
        ]),
    Section(name: "Streaming Quality", items: [
        Item(name: "Auto", isSelected: false, cellType: CellType.radioCell),
        Item(name: "Low", isSelected: false, cellType: CellType.radioCell),
        Item(name: "Medium", isSelected: false, cellType: CellType.radioCell),
        Item(name: "High", isSelected: false, cellType: CellType.radioCell),
        Item(name: "Note: Highter quality will consume more data. Data usage and quality may vary based on network consitions.", isSelected: false, cellType: CellType.subTitleCell)
        ]),
    Section(name: "Download Quality", items: [
        Item(name: "Low", isSelected: false, cellType: CellType.radioCell),
        Item(name: "Medium", isSelected: false, cellType: CellType.radioCell),
        Item(name: "High", isSelected: false, cellType: CellType.radioCell),
        Item(name: "Note: Higher resolution will consume more data. Data usage may vary based on network conditions.", isSelected: false, cellType: CellType.subTitleCell),
        Item(name: "Download Over WiFi Only", isSelected: false, cellType: CellType.switchCell)
        ]),
    Section(name: "Notification Controls", items: [
        Item(name: "Allow Notifications", isSelected: false, cellType: CellType.switchCell),
        Item(name: "Show Download Notification", isSelected: false, cellType: CellType.switchCell)
        ]),
    Section(name: "Rate This App", items: nil),
    Section(name: "Refresh Account", items: nil),
    Section(name: "Log Out", items: nil)
]
