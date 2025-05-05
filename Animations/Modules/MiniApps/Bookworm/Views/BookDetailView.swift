//
//  BookDetailView.swift
//  Animations
//
//  Created by Kevin Boulala on 25/02/2025.
//

import SwiftData
import SwiftUI

struct BookDetailView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var isShowingAlert = false
    
    let book: Book
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre)
                    .resizable()
                    .scaledToFit()
                Text(book.genre.uppercased())
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundStyle(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(.capsule)
                    .offset(x: -5, y: -5)
            }
            
            Text(book.author)
                .font(.title)
                .foregroundStyle(.secondary)
            
            Text(book.review)
                .padding()
            
            StarRating(rating: .constant(book.rating))
        }
        .toolbar {
            ToolbarItem {
                Button("Remove Book", systemImage: "trash") {
                    isShowingAlert.toggle()
                }
            }
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert("⚠️", isPresented: $isShowingAlert) {
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Are you sure you want to remove this book?")
        }
    }
    
    private func deleteBook() {
        modelContext.delete(book)
        try? modelContext.save() // ???
        dismiss()
    }
}

#Preview {
    BookDetailView(book: Book(title: "Title",
                              author: "Author",
                              genre: "Fantasy",
                              review: "Lorem ipsum dolore sit amet",
                              rating: 3))
}

//#Preview {
//    do {
//        let config = ModelConfiguration(isStoredInMemoryOnly: true)
//        let container = try ModelContainer(for: Book.self,
//                                           configurations: config)
//        let example = Book(title: "Test Book", author: "Test Author", genre: "Fantasy", review: "This was a great book; I really enjoyed it.", rating: 4)
//        return BookDetailView(book: example).modelContainer(container)
//    } catch {
//            return Text("Failed to create preview: \(error.localizedDescription)")
//    }
//}
