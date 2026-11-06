import SwiftUI

enum SidebarItem: String, Identifiable, CaseIterable {
    case notes = "Notes"
    case settings = "Settings"

    var id: Self { self }

    var icon: String {
        switch self {
        case .notes: "note.text"
        case .settings: "gear"
        }
    }
}

struct SidebarRow: View {
    let item: SidebarItem

    var body: some View {
        Label(item.rawValue, systemImage: item.icon)
    }
}

struct vwAside: View {
    @State private var selection: SidebarItem? = .notes

    var body: some View {
        List(SidebarItem.allCases, selection: $selection) { item in
            SidebarRow(item: item)
                .tag(item)
        }
        .listStyle(.sidebar)
        .navigationTitle("Menu")
    }
}

#Preview {
    NavigationSplitView {
        vwAside()
    } detail: {
        Text("Detail")
    }
}
