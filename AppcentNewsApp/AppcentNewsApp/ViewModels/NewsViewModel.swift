//
//  NewsViewModel.swift
//  AppcentNewsApp
//
//  Created by Hasan Dag on 22.05.2021.
//

import Foundation

struct NewsViewModel {
    let news : News
    
    var  author : String{
        return news.author ?? ""
    }
    var  title : String{
        return news.content ?? ""
    }
    var  description : String{
        return news.description ?? ""
    }
    var  url : String{
        return news.url ?? ""
    }
    var  urlToImage : String{
        return news.urlToImage ?? ""
    }
    var  publishedAt : String{
        return news.publishedAt ?? ""
    }
    var  content : String{
        return news.content ?? ""
    }
    let source : Source
    //--------------------- Source  attributes burda başlıyor ----------------
    var  sourceid : String{
        return source.id ?? ""
    }
    var  sourcename : String{
        return source.name ?? ""
    }
    
    var  sourcedescription : String{
        return source.description ?? ""
    }
    var  sourceurl : String{
        return source.url ?? ""
    }
    var  sourcecatogory : String{
        return source.category ?? ""
    }
    var  sourcelanguage : String{
        return source.language ?? ""
    }
    var  sourcecountry : String{
        return source.country ?? ""
    }
}
