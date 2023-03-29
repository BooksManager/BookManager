//
//  Books.swift
//  BookManager
//
//

import Foundation

struct Book : Decodable {
    var title: String
    var authors: String
    var averageRating: Float
    var pageCount: Int
    var language: String
    var description: String
    
//    static var posterBaseURLString: String = "https://image.tmdb.org/t/p/w185"
    
}


extension Book {
    
    /// An array of mock tracks
    static var mockBooks: Book  =
        Book(title: "Harry Potter and the Philosopher's Stone", authors: "J.K. Rowling", averageRating: 5, pageCount: 336, language: "EN", description: "Rescued from the outrageous neglect of his aunt and uncle, a young boy with a great destiny proves his worth while attending Hogwarts School for Wizards and Witches.")
        
    
    
    
//        Book(original_title: "Puss in Boots: The Last Wish",
//              overview: "Puss in Boots discovers that his passion for adventure has taken its toll: He has burned through eight of his nine lives, leaving him with only one life left. Puss sets out on an epic journey to find the mythical Last Wish and restore his nine lives.",
//              poster_path: "/kuf6dutpsT0vSVehic3EZIqkOBt.jpg",
//              vote_average: 8.6,
//              vote_count: 2900),
//    ]
}

