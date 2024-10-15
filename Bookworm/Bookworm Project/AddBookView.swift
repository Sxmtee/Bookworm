//
//  AddBookView.swift
//  Bookworm
//
//  Created by mac on 12/10/2024.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var genre = "Fantasy"
    @State private var review = ""
    @State private var rating = 3
    
    let genres = [
        "Thriller",
        "Poetry",
        "Fantasy",
        "Horror",
        "Kids",
        "Mystery",
        "Romance"
    ]
    
    var hasValidAddress: Bool {
        if title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            || author.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            || review.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        {
            return false
        }
        
        return true
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of Book", text: $title)
                    TextField("Author's Name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("Write a Review") {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                }
                
                Section {
                    Button("Save") {
                        let newBook = Book(
                            title: title,
                            author: author,
                            genre: genre,
                            review: review,
                            rating: rating
                        )
                        
                        modelContext.insert(newBook)
                        
                        dismiss()
                    }
                }
                .disabled(hasValidAddress==false)
            }
            .navigationTitle("Add Book")
        }
    }
}

#Preview {
    AddBookView()
}
