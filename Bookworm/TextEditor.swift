//
//  TextEditor.swift
//  Bookworm
//
//  Created by mac on 12/10/2024.
//

//Accepting multi-line text input with TextEditor

import SwiftUI

struct NotesView: View {
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
        NavigationStack {
            TextField("Enter your name", text: $notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .navigationTitle("Notes")
                .padding()
            
            TextEditor(text: $notes)
                .textFieldStyle(.roundedBorder)
                .navigationTitle("Notes")
                .padding()
        }
    }
}

#Preview {
    NotesView()
}
