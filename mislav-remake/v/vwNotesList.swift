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
    let item: SettingsItem

    var body: some View {
        Label(item.rawValue, systemImage: item.icon)
    }
}

struct vwNotesList: View {
    @Environment(vmNotes.self) private var vm
    @State private var selection : UUID?

    var body: some View {
        @Bindable var vm = vm
            List(selection: $vm.activeNote.Id) {
                ForEach(vm.notes, id: \.Id) {
                    note in Text(note.Title != "" ? note.Title : "New Note")
                }
            }
            .listStyle(.sidebar)
            .navigationTitle("Menu")
            .toolbar {
                Button("New Note", systemImage: "square.and.pencil") {
                    let note = Note("")
                    vm.newNote(note)
                    selection = note.Id
                }
                
                Button("Delete Note", systemImage: "trash.fill") {
                    if let selection = vm.activeNote.Id {
                        vm.delNote(selection)
                    }
                }
            }
        }
    }

