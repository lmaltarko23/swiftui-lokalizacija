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
        
    var name: String {
        switch self {
        case .notes: String(localized: "sidebarItem.notes")
        case .settings: String(localized: "sidebarItem.settings")
        }
    }
}

struct SidebarRow: View {
    let item: SidebarItem

    var body: some View {
        Label(item.name, systemImage: item.icon)
    }
}

struct vwAside: View {
    @Binding var selection: SidebarItem
    
    var body: some View {
        List(SidebarItem.allCases, selection: $selection) { item in
            SidebarRow(item: item)
                .tag(item)
        }
        .listStyle(.sidebar)
        .navigationTitle("aside.Title")
    }
}

#Preview {
    NavigationSplitView {
        vwAside(selection: .constant(.notes))
    } detail: {
        Text("Detail")
    }
}
