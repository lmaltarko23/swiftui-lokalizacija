//
//  NoteViewModel.swift
//  swift-notes-app
//
//  Created by FOI on 03.11.2026..
//

import Foundation


@Observable public class vmNotes {

    var notes: [Note] = []
    var activeNote = ModelNote()

    init() {
        getDemoData()
    }
    
    func getDemoData() {
        newDemoNote(title: "Probna bilješka A", note: "Moja prva SWIFT bilješka")
        newDemoNote("Probna bilješka B")
        newDemoNote("Probna bilješka C")
        newDemoNote("Probna bilješka D")
    }
    
    func newDemoNote(_ noteTitle: String) {
        notes.append(Note(noteTitle))
    }
    
    func newDemoNote(title: String, note: String) {
        notes.append(Note(title: title, note: note))
    }
    
    func newNote(_ note: Note) {
        notes.append(note)
    }
    
    func updNote(_ note: Note) {
        if let index = getIndex(note) {
            notes[index] = note
        }
    }
    
    func delNote(_ note: Note) {
        if let index = getIndex(note) {
            notes.remove(at: index)
        }
    }
    
    public func getIndex(_ note: Note) -> Int? {
        return notes.firstIndex(where: {$0.Id == note.Id})
    }
    
    public func getIndex(id: UUID) -> Int? {
        return notes.firstIndex(where: {$0.Id == id})
    }
    
    
}
