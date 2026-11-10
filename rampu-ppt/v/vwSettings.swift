import SwiftUI

enum SettingsItem: String, Identifiable, CaseIterable {
    case language = "Language"
    case locale = "Locale"

    var id: Self { self }

    var icon: String {
        switch self {
        case .language: "translate"
        case .locale: "globe"
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
    @Binding var selection: SettingsItem

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
        vwSettingsList(selection: .constant(.language))
    } detail: {
        Text("Detail")
    }
}
