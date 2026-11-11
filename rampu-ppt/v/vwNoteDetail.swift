//
//  vwNoteEdit.swift
//  mislav-remake
//
//  Created by FOI on 06.11.2026..
//

import SwiftUI

struct vwSelectANote: View {
    var body: some View {
        VStack {
            Text("noteEdit.noNoteSelected.title")
            Text("noteEdit.noNoteSelected.explainer")
        }
    }
}

struct vwNoteEdit: View {
    @Bindable var note: Note
    var body: some View {
        VStack {
            TextField("noteEdit.placeholder.noteTitle", text: $note.Title).font(.title)
            HStack {
                Text(String(localized: "noteEdit.text.CreatedAt") + " " + note.CreatedAt.formatted()).padding(.leading, 60)
                Spacer()
                Text(String(localized: "noteEdit.text.CreatedAt") + " " + note.LastModifiedAt.formatted()).padding(.trailing, 60)
            }
            TextField("noteEdit.placeholder.noteContent", text: $note.Content)
        }
    }
}

struct vwNoteDetail: View {
    @Environment(vmNotes.self) private var vm

    var note: Note?
    var body: some View {
        ScrollView {
            if let note {
                vwNoteEdit(note: note)
            }
            else {
                vwSelectANote()
            }
        }
    }
}

