//
//  BookRow.swift
//  PreviewScreenshot
//
//  Created by Peter Pan on 2023/2/4.
//

import SwiftUI

struct BookRow: View {
    let book: String
    
    var body: some View {
        HStack {
            Image(book)
                .resizable()
                .scaledToFit()
                .frame(width: 100)
            Text(book)
        }
    }
}


struct BookRow_Previews: PreviewProvider {
    static var previews: some View {
        BookRow(book: "Asynchronous Programming with SwiftUI and Combine")
    }
}
