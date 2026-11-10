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
            Text("No note selected")
            Text("Please pick a note")
        }
    }
}

struct vwNoteEdit: View {
    @Bindable var note: Note
    var body: some View {
        VStack {
            TextField("Title", text: $note.Title).font(.title)
            HStack {
                Text("Created at: " + note.CreatedAt.formatted()).padding(.leading, 60)
                Spacer()
                Text("Last Modified: " + note.LastModifiedAt.formatted()).padding(.trailing, 60)
            }
            TextField("Content", text: $note.Content)
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

