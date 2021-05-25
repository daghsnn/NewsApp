//
//  NewsFavorite.swift
//  AppcentNewsApp
//
//  Created by Hasan Dag on 25.05.2021.
//

import Foundation
import UIKit

struct NewsFavModel {
    let status:String?
    let totalResults : Int?
    let articles : [NewsFav]
}

class NewsFav {
    let author : String?
    let title : String?
    let description : String?
    let url:String?
    let urlToImage : String?
    let publishedAt : String?
    let content : String?
    var favcount = 0
    
    init(author1:String,title1:String,description1:String,url1:String,urlToImage1:String,publishedAt1:String) {
        self.author = author1
        self.title = title1
        self.description = description1
        self.url = url1
        self.urlToImage = urlToImage1
        self.publishedAt = publishedAt1
        self.content = ""
        self.favcount += 1
        print("added to favorites tab")
    }
    
   
    
}

extension News{
    
    
}
