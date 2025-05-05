//
//  BookwormView.swift
//  Animations
//
//  Created by Kevin Boulala on 24/02/2025.
//

import SwiftData
import SwiftUI

struct BookwormView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query(sort: [
        SortDescriptor(\Book.rating, order: .reverse),
        SortDescriptor(\Book.author)
    ]) private var books: [Book]
    
    @State private var showingAddBookScreen = false
    
    var body: some View {
        VStack {
            TitleAppearance(title: "Bookworm")
            
            List {
                ForEach(books, id: \.self) { book in
                    NavigationLink(value: book) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .font(.headline)
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                            Spacer()
                            EmojiRating(rating: book.rating)
                        }
                    }
                }
                .onDelete(perform: deleteBook(at:))
            }
            .navigationDestination(for: Book.self) { book in
                BookDetailView(book: book)
            }
        }
        .sheet(isPresented: $showingAddBookScreen) {
            AddBookView()
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                EditButton()
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Add Book", systemImage: "plus") {
                    showingAddBookScreen.toggle()
                }
            }
        }
    }
    
    private func deleteBook(at indexes: IndexSet) {
        for index in indexes {
            let book = books[index]
            modelContext.delete(book)
        }
    }
}

#Preview {
    BookwormView()
}
