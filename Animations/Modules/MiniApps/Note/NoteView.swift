//
//  NoteView.swift
//  Animations
//
//  Created by Kevin Boulala on 13/03/2025.
//

import SwiftUI

struct NoteView: View {
    
    @State private var text = ""
    @State private var oldText = ""
    @State private var filename = ""
    @State private var oldFilename = ""
    
    @State private var isShowingNewNote = false
    @State private var isShowingOpenNote = false
    @State private var isShowingDelationConfirmation = false
    
    var body: some View {
        VStack {
            TitleAppearance(title: "Note \(filename.isEmpty ? "" : "- \(filename)")")
            if filename.isEmpty {
                ContentUnavailableView("No note selected", systemImage: "pencil")
                    .padding(.bottom, 160)
            } else {
                TextEditor(text: $text)
            }
        }
        .onChange(of: text, save)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("New", systemImage: "square.and.pencil", action: tapOnNewNote)
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Open...", systemImage: "folder", action: tapOnOpenNote)
            }
            if !filename.isEmpty {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Delete note", systemImage: "trash", action: tapOnDeleteNote)
                        .tint(.red)
                }
            }
        }
        .alert("Create a new note...", isPresented: $isShowingNewNote) {
            TextField("Note name...", text: $filename)
            Button("OK", action: newNoteStarted)
            Button("Cancel", role: .cancel, action: cancelNewNote)
        }
        .alert("Delete note", isPresented: $isShowingDelationConfirmation) {
            Button("Confirm", role: .destructive, action: deleteNote)
            Button("Cancel", role: .cancel) {}
        }
        .confirmationDialog("Select a note", isPresented: $isShowingOpenNote) {
            let urls = allNotes
            ForEach(urls, id: \.self) { url in
                let filename = url.lastPathComponent.replacingOccurrences(of: ".txt", with: "")
                Button(filename) { open(filename, at: url) }
            }
            Button("Cancel", role: .cancel) {}
        }
    }
    
    // MARK: - Properties
    
    private var notesDirectory: URL {
        URL.documentsDirectory.appending(path: "notes/")
    }
    
    private var allNotes: [URL] {
        guard let directoryURLs = try? FileManager.default.contentsOfDirectory(at: notesDirectory, includingPropertiesForKeys: nil, options: []) else {
            return []
        }
        return directoryURLs.filter { $0.pathExtension == "txt" }.sorted { $0.lastPathComponent < $1.lastPathComponent }
    }
    
    // MARK: - Actions
    
    private func tapOnNewNote() {
        oldText = text
        oldFilename = filename
        
        filename = ""
        text = ""
        
        isShowingNewNote = true
    }
    
    private func tapOnOpenNote() {
        isShowingOpenNote = true
    }
    
    private func tapOnDeleteNote() {
        isShowingDelationConfirmation = true
    }

    // MARK: - Note management

    private func newNoteStarted() {        
        if !FileManager.default.fileExists(atPath: notesDirectory.path()) {
            do {
                try FileManager.default.createDirectory(atPath: notesDirectory.path(), withIntermediateDirectories: true, attributes: nil)
            } catch {
                NSLog("‼️ Failed to create directory: \(error.localizedDescription)")
            }
        }
        
        save()
    }
    
    // MARK: Without hyphen
    
    private func cancelNewNote() {
        text = oldText
        oldText = ""
        filename = oldFilename
        oldFilename = ""
    }
    
    private func save() {
        guard !filename.isEmpty else { return }
        
        let data = Data(text.utf8)
        let url = notesDirectory.appending(path: "\(filename).txt")
        
        do {
            try data.write(to: url, options: [.atomic, .completeFileProtection])
        } catch {
            NSLog("‼️ Failed to save file \(filename): \(error.localizedDescription)")
        }
    }
    
    private func open(_ filename: String, at url: URL) {
        self.filename = filename
        text = ""
        
        do {
            let input = try String(contentsOf: url)
            text = input
        } catch {
            NSLog("‼️ Failed to read file \(filename): \(error.localizedDescription)")
        }
    }
    
    private func deleteNote() {
        let url = notesDirectory.appending(path: "\(filename).txt")
        
        do {
            try FileManager.default.removeItem(at: url)
            filename = ""
            text = ""
        } catch {
            NSLog("‼️ Failed to delete file \(url): \(error.localizedDescription)")
        }
    }
}

#Preview {
    NoteView()
}
