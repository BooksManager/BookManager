//
//  BookResponse.swift
//  BookManager
//
//  Created by Akhil Thata on 3/29/23.
//

import Foundation

struct BookResponse:Decodable {
    var items: [Book]
}

struct Book:Decodable {
    var id: String
    var volumeInfo: Volume
    var pageNumber: Int?;
    
    private enum CodingKeys: String, CodingKey {
        case id, volumeInfo
        case pageNumber = "page_number"
    }
}

struct Volume:Decodable {
    var title:String?
    var authors:[String]?
    var description:String?
    var pageCount:Int?
    var language:String?
    var imageLinks: Images?
    var averageRating: Double?
}

struct Images: Decodable{
    var smallThumbnail: String?
    var thumbnail: String?
}
