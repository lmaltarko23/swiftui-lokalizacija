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
    var note: Note
    var body: some View {
        VStack {
            Text(note.Title)
            Text(note.Content)
        }
    }
}

struct vwNoteDetail: View {
    var note: Note?
    var body: some View {
        if let note {
            vwNoteEdit(note: note)
        }
        else {
            vwSelectANote()
        }
    }
}

