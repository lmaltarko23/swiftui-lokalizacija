//
//  NoteViewModel.swift
//  swift-notes-app
//
//  Created by FOI on 03.11.2026..
//

import Foundation
import SwiftData


@Observable public class vmNotes {
    
    var notes: [Note] = []
    var activeNote = ModelNote()
    private let swiftdata = try! ModelContainer(for: Note.self)
    
    init() {
        notes = (try! swiftdata.mainContext.fetch(FetchDescriptor<Note>()))
        if notes.isEmpty {
            let demoNotes: [Note]  = getDemoNotes()
            for note in demoNotes {
                newNote(note)
            }
        }
    }
    
    func getDemoNotes() -> [Note] {
        var demoNotes: [Note] = [];
        
        demoNotes.append(Note(title: "Probna bilješka A", note: "Moja prva SWIFT bilješka"))
        demoNotes.append(Note("Probna bilješka B"))
        demoNotes.append(Note("Probna bilješka C"))
        demoNotes.append(Note("Probna bilješka D"))
        
        return demoNotes
    }
    
    func newNote(_ note: Note) {
        swiftdata.mainContext.insert(note)
        updNote(note)   // swiftdata db update
        notes.append(note)  // lokalni update
    }
    
    
    func delNote(_ id: UUID) {
        let index = getIndex(id: id)
        if index != nil {
            swiftdata.mainContext.delete(notes[index!])
            updNote(notes[index!])
            notes.remove(at: index!)
        }
    }
    
    func updNote(_ note: Note) {
        try? swiftdata.mainContext.save()
    }

    private func getIndex(_ note: Note) -> Int? {
        return notes.firstIndex(where: {$0.Id == note.Id})
    }
    
    private func getIndex(id: UUID) -> Int? {
        return notes.firstIndex(where: {$0.Id == id})
    }
    
    public func getNote(id: UUID) -> Note? {
        return notes.first(where: {$0.Id == id})
    }
}
