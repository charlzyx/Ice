//
//  SettingsNavigationIdentifier.swift
//  Ice
//

import SwiftUI

/// An identifier used for navigation in the settings interface.
enum SettingsNavigationIdentifier: String, NavigationIdentifier {
    case general = "General"
    case menuBarLayout = "Menu Bar Layout"
    case menuBarAppearance = "Menu Bar Appearance"
    case hotkeys = "Hotkeys"
    case advanced = "Advanced"
    case about = "About"

    var localized: LocalizedStringKey {
        switch self {
        case .general: "通用"
        case .menuBarLayout: "菜单栏布局"
        case .menuBarAppearance: "菜单栏外观"
        case .hotkeys: "快捷键"
        case .advanced: "高级"
        case .about: "关于"
        }
    }
}
