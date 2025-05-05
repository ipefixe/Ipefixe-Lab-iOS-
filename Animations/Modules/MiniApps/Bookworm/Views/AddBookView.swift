//
//  AddBookView.swift
//  Animations
//
//  Created by Kevin Boulala on 24/02/2025.
//

import SwiftData
import SwiftUI

struct AddBookView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var isShowingAlert = false
    @State private var alertMessage = ""
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    
    private let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        Form {
            Section {
                TextField("Name of book", text: $title)
                TextField("Author's name", text: $author)
                
                Picker("Genre", selection: $genre) {
                    ForEach(genres, id: \.self) {
                        Text($0)
                    }
                }
            }
            
            Section("Write a review") {
                TextEditor(text: $review)
                StarRating(rating: $rating)
                    .padding(.vertical)
            }
            
            Section {
                Button("Save") {
                    let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating)
                    let descriptor = FetchDescriptor<Book>(
                        predicate: #Predicate<Book> { $0.title == title && $0.author == author }
                    )
                    
                    let countResult = (try? modelContext.fetchCount(descriptor)) ?? 0
                    if countResult > 0 {
                        alertMessage = "\(title) by \(author) already exists"
                        isShowingAlert.toggle()
                    } else {
                        modelContext.insert(newBook)
                        dismiss()
                    }
                }
                .disabled(title.isEmpty || author.isEmpty)
            }
        }
        .navigationTitle("Add Book")
        .scrollBounceBehavior(.basedOnSize)
        .alert("👀", isPresented: $isShowingAlert) {
            Button("OK") {}
        } message: {
            Text(alertMessage)
        }
    }
}

#Preview {
    AddBookView()
}
