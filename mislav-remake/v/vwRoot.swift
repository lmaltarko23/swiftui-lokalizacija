import SwiftUI
import Playgrounds

struct vwRoot: View {
    @State private var vm = vmNotes()
    @State private var selectedNote: Note?
    @State private var asideItem: SidebarItem = .notes


    var body: some View {
        NavigationSplitView{
            vwAside(selection: $asideItem)
        } content: {
            if asideItem == .notes {
                vwNotesList()
            }
            else {
                vwSettingsList()
            }

        } detail: {
            if asideItem == .notes {
                vwNoteDetail(note: vm.notes.first(where: {$0.Id == vm.activeNote.Id}))
            }
        }.environment(vm)
    }
}

#Preview {
    vwRoot()
}

#Playground {
    _ = 1 + 2
}
