//
//  ViewController.swift
//  AppcentNewsApp
//
//  Created by Hasan Dag on 21.05.2021.
//

import UIKit
import Kingfisher

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, UISearchBarDelegate {
    let network = NetworkManager()
    var news = [News]()
    //var newssearch = [News]()
    
   /* NetworkManager.shared.getNews(query: "q=\(lblSearch.text)") { (newNews) in
        self.news = newNews!
        print(self.news[0].author!) */
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mysearchbar: UISearchBar!
    
    var searching = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        network.getNews() { (data) in
            self.news = data!
            print(self.news[5].urlToImage)
            DispatchQueue.main.async {
                self.tableView.reloadData()
                }
            
        }

        
        tableView.delegate = self
        tableView.dataSource = self
        mysearchbar.delegate = self
        
            //bi ton yol denedim fakat hala unwrap thread hatası alıyor 5 gündür çalışıyordu block favorites ile details alakasını yapınca buraya nil gelmeye başladı
            //{"status":"error","code":"rateLimited","message":"You have made too many requests recently. Developer accounts are limited to 100 requests over a 24 hour period (50 requests available every 12 hours). Please upgrade to a paid plan if you need more requests."}
           
            
        
        
           
            /* do{
            self.news = data!
        }
        catch{
            print("error")
        }*/
            
        
        /*NetworkManager.shared.getNews(nq: "") { (newss) in
            self.news = (newss)!
            print(self.news[0].author!)}*/
            
       
               

    
            // Do any additional setup after loading the view.
        
        }
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {

       return true
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        network.getNews() { (data) in
            self.news = data!
            print(self.news[0])
            
       
            DispatchQueue.main.async {
                self.tableView.reloadData()
                

                }

                }
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        network.getNews() { (data) in
            self.news = data!
            print(self.news[0])
            
       
            DispatchQueue.main.async {
                self.tableView.reloadData()
                

                }

                }
        self.viewDidLoad()
    }
    func searchBar(_ searchBar:UISearchBar, textDidChange searchText: String) {
        
        ///searchbar value silinince error alıyorum farklı 5-6 yol denedim buraya tekrar bak ayrıca network yükü çoğaldı iki tane api call ile
        
        let searchtext = mysearchbar.text
        if (searchtext != "") {
        
            network.getNewswith(nq:searchtext!) { (data) in
            self.news = data!
            
           /* searching = news.filter({ (News) in
                self.search.pref
            })*/
            DispatchQueue.main.async {
                self.tableView.reloadData()
                
                }
            }
                
            }
        else{
            network.getNews() { (data) in
                self.news = data!
                print(self.news[0])
                
           
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    

                    }

                    }
           // self.viewDidLoad() searchbarda yazı yoksa bi türlü main threada giremiyor en son aratılan key de kalıyor
        }
        
        if (searchtext == nil) {
        
            network.getNews() { (data) in
            self.news = data!
            
           /* searching = news.filter({ (News) in
                self.search.pref
            })*/
            DispatchQueue.main.async {
                self.tableView.reloadData()
                
                }
            }
        }

    }
    
    
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        //return aranan haberler return o haberlerin cellforrowat didselected
        return news.count
            
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! ViewTableCell
        //let tablenews = news[indexPath.row] denedim ama thread error
        
        cell.newsTitle.setTitle(news[indexPath.row].title, for: .normal)
        cell.textField.text = news[indexPath.row].description
      
        cell.imgView.kf.setImage(with: URL(string: self.news[indexPath.row].urlToImage ?? "https://www.publicdomainpictures.net/en/view-image.php?image=270609&picture=not-found-image"))
        
        //let imgurl = URL(string: tablenews.urlToImage!)
        //cell.imgView.image = UIImage(contentsOfFile: tablenews.urlToImage!)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "detailsVC") as? DetailsViewController
        vc?.authorname = news[indexPath.row].author
        vc?.descript = news[indexPath.row].description
        vc?.titledt = news[indexPath.row].title
        vc?.date = news[indexPath.row].publishedAt
        vc?.imageUrl = news[indexPath.row].urlToImage
        vc?.sendedurl = news[indexPath.row].url
        vc?.sharedurl = news[indexPath.row].url
        self.navigationController?.pushViewController(vc!, animated: true)
        //let selectnew = news[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
    }
  
    
}

extension UIImageView{
    
    
}
    
    




    


