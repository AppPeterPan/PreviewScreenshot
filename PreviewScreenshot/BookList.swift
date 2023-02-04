//
//  BookList.swift
//  PreviewScreenshot
//
//  Created by Peter Pan on 2023/2/4.
//

import SwiftUI

struct BookList: View {
    let books = [
        "Asynchronous Programming with SwiftUI and Combine",
        "SwiftUI Animations by Tutorials",
        "Starting Chess"
    ]
    
    var body: some View {
        NavigationStack {
            List(books, id: \.self) { book in
                BookRow(book: book)
            }
            .navigationTitle("希望今年看完的書")
        }
    }
}

struct BookList_Previews: PreviewProvider {
    static var previews: some View {
        BookList()
            .previewScreenshot()
    }
}

