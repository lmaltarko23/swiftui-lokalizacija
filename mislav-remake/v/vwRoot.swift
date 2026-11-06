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
            vwNoteDetail(note: selectedNote)
        }.environment(vm)
    }
}

#Preview {
    vwRoot()
}

#Playground {
    _ = 1 + 2
}
