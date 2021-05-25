//
//  NetworkManager.swift
//  AppcentNewsApp
//
//  Created by Hasan Dag on 21.05.2021.
//


import Foundation

class NetworkManager {
    let imageCache = NSCache<NSString,NSData>()
    //let keyword : String?
    private var query = "q=default"
    static let shared = NetworkManager()
    private let baseUrl = "https://newsapi.org/v2/everything?"
    /*var secondUrl: String {
        get{secondUrl = ViewController.searching()}
        set{newValue}
    }*/
    //var q :String?
    init(){}
   
    //func getNews(query:String,completion: @escaping ([News]?) -> Void)

    func getNews(completion: @escaping ([News]?) -> Void)
    {
       
        let urlString = "\(baseUrl)\(self.query)&apiKey=\(API.apikey)"
        guard let url = URL(string: urlString) else {
            return
        }
        
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                completion(nil)
                print(error!)
            }
            else{
                let NewsEverything = try? JSONDecoder().decode(NewsModel.self, from: data!)
                NewsEverything == nil ? completion(nil) : completion(NewsEverything?.articles)
                //NewsModel de articles array tamam olmalı
                
            }
            
        }.resume()
    }
    func getNewswith(nq : String,completion: @escaping ([News]?) -> Void)
    {
        if nq == "" {
            self.query = "q=default"
        }
        else{
            self.query = "q=\(nq)"
        }

        let urlString = "\(baseUrl)\(self.query)&apiKey=\(API.apikey)"
        guard let url = URL(string: urlString) else {
            return
        }
        
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                completion(nil)
                print(error!)
            }
            else{
                let NewsEverything = try? JSONDecoder().decode(NewsModel.self, from: data!)
                NewsEverything == nil ? completion(nil) : completion(NewsEverything?.articles)
                //NewsModel de articles array tamam olmalı
                
            }
            
        }.resume()
    }
    
    
    func getImage(urlString:String, completion: @escaping (Data?)->Void){
        guard let url = URL(string: urlString) else {
            completion(nil)
            return}
        if let cache = imageCache.object(forKey: NSString(string:urlString)){
            completion(cache as Data)
        }
        else {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard error == nil, let data = data else {
                    completion(nil)
                    return
                }
                self.imageCache.setObject(data as NSData, forKey: NSString(string:urlString))
                completion(data)
            }.resume()
        }
    }
  
}


/* eger topheadlines ve everyting arasında aratma yapabilirsem kod bloğunu kaldır ve Network managere secondurl : secondUrl = secondUrl() init yapmaya çalış
enum secondUrl:String {
    case everything = "everything?"
    case topheadlines = "top-headlines?country="
    
}




enum country:String{
    case ae,ar,at,au,be,bg,br,ca,ch,cn,co,cu,cz,de,eg,fr,gb,gr,hk,hu,id,ie,il,it,jp,kr,lt,lv,ma,mx,my,ng,nl,no,nz,php,lp,tr,or,sr,us,ve,za
    
   
}
*/
