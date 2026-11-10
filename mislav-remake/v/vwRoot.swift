import SwiftUI
import Playgrounds

struct vwRoot: View {
    @State private var vm = vmNotes()
    @State private var selectedNote: Note?
    

    var body: some View {
        NavigationSplitView{
            vwAside()
        } content: {
            vwNotesList()

        } detail: {
            vwNoteDetail(note: vm.notes.first(where: {$0.Id == vm.activeNote.Id}))
        }.environment(vm)
    }
}

#Preview {
    vwRoot()
}

#Playground {
    _ = 1 + 2
}
