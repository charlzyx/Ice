//
//  HotkeysSettingsPane.swift
//  Ice
//

import SwiftUI

struct HotkeysSettingsPane: View {
    @EnvironmentObject var appState: AppState

    private var hotkeySettingsManager: HotkeySettingsManager {
        appState.settingsManager.hotkeySettingsManager
    }

    var body: some View {
        IceForm {
            IceSection("菜单栏分组") {
                hotkeyRecorder(forSection: .hidden)
                hotkeyRecorder(forSection: .alwaysHidden)
            }
            IceSection("菜单栏图标") {
                hotkeyRecorder(forAction: .searchMenuBarItems)
            }
            IceSection("其他") {
                hotkeyRecorder(forAction: .enableIceBar)
                hotkeyRecorder(forAction: .showSectionDividers)
                hotkeyRecorder(forAction: .toggleApplicationMenus)
            }
        }
    }

    @ViewBuilder
    private func hotkeyRecorder(forAction action: HotkeyAction) -> some View {
        if let hotkey = hotkeySettingsManager.hotkey(withAction: action) {
            HotkeyRecorder(hotkey: hotkey) {
                switch action {
                case .toggleHiddenSection:
                    Text("切换“隐藏”分组")
                case .toggleAlwaysHiddenSection:
                    Text("切换“始终隐藏”分组")
                case .searchMenuBarItems:
                    Text("搜索菜单栏图标")
                case .enableIceBar:
                    Text("启用 Ice Bar")
                case .showSectionDividers:
                    Text("显示分组分隔符")
                case .toggleApplicationMenus:
                    Text("切换应用菜单")
                }
            }
        }
    }

    @ViewBuilder
    private func hotkeyRecorder(forSection name: MenuBarSection.Name) -> some View {
        if appState.menuBarManager.section(withName: name)?.isEnabled == true {
            if case .hidden = name {
                hotkeyRecorder(forAction: .toggleHiddenSection)
            } else if case .alwaysHidden = name {
                hotkeyRecorder(forAction: .toggleAlwaysHiddenSection)
            }
        }
    }
}
