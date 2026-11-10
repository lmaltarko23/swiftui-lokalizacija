//
//  note.swift
//  swift-notes-app
//
//  Created by FOI on 03.11.2026..
//

import Foundation
import SwiftData

struct ModelNote {
    var Id: UUID?
}

@Model public class Note {
    public var Id: UUID
    public var Title: String
    public var Content: String
    public var CreatedAt: Date
    public var LastModifiedAt: Date
    
    init (_ title: String) {
        self.Title = title
        self.Content = "";
        self.Id = UUID()
        self.CreatedAt = Date.now
        self.LastModifiedAt = Date.now
    }
    
    init ( title: String,  note: String) {
        self.Title = title
        self.Content = note;
        self.Id = UUID()
        self.CreatedAt = Date.now
        self.LastModifiedAt = Date.now
    }
}
