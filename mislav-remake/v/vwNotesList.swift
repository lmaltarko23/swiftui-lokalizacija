//
//  vwNotesList.swift
//  mislav-remake
//
//  Created by FOI on 06.11.2026..
//

import SwiftUI

enum NotesListItem: String, Identifiable, CaseIterable {
    case notes = "Notes"
    case settings = "Settings"

    var id: Self { self }
}

struct NotesListRow: View {
    let item: SidebarItem

    var body: some View {
        Label(item.rawValue, systemImage: item.icon)
    }
}

struct vwNotesList: View {
    @Environment(vmNotes.self) private var vm

    var body: some View {
        @Bindable var vm = vm
            List(selection: $vm.activeNote.Id) {
                ForEach(vm.notes, id: \.Id) {
                    note in Text(note.Title)
                }
            }
            .listStyle(.sidebar)
            .navigationTitle("Menu")
    }
}

