import SwiftUI

enum SettingsItem: String, Identifiable, CaseIterable {
    case notes = "Language"
    case settings = "Locale"

    var id: Self { self }

    var icon: String {
        switch self {
        case .notes: "translate"
        case .settings: "globe"
        }
    }
}

struct SettingsRow: View {
    let item: SettingsItem

    var body: some View {
        Label(item.rawValue, systemImage: item.icon)
    }
}

struct vwSettingsList: View {
    @State private var selection: SettingsItem = .notes

    var body: some View {
        List(SettingsItem.allCases, selection: $selection ) { item in
            SettingsRow(item: item)
                .tag(item)
        }
        .listStyle(.sidebar)
        .navigationTitle("Menu")
    }
}

#Preview {
    NavigationSplitView {
        vwSettingsList()
    } detail: {
        Text("Detail")
    }
}
