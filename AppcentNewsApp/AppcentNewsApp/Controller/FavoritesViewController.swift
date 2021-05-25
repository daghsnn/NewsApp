//
//  FavoritesViewController.swift
//  AppcentNewsApp
//
//  Created by Hasan Dag on 25.05.2021.
//

import UIKit
import Kingfisher

class FavoritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var favData = [NewsFav]()
    let favnetwork = NetworkManager()

    var emptydata = [News]()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        favnetwork.getNews() { (data) in
            self.emptydata = data!
            DispatchQueue.main.async {
                self.tableView.reloadData()
                }
            
        }
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoruiteCell", for: indexPath) as! FavoritesTableViewCell
        cell.newsTitle.setTitle(favData[indexPath.row].title, for: .normal)
        cell.newsText.text = favData[indexPath.row].description
        cell.newsImg.kf.setImage(with:URL(string: self.favData[indexPath.row].urlToImage ?? "https://www.publicdomainpictures.net/en/view-image.php?image=270609&picture=not-found-image") )
        
        
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "detailsVC") as? DetailsViewController
        
        vc?.authorname = favData[indexPath.row].author
        vc?.descript = favData[indexPath.row].description
        vc?.titledt = favData[indexPath.row].title
        vc?.date = favData[indexPath.row].publishedAt
        vc?.imageUrl = favData[indexPath.row].urlToImage
        vc?.sendedurl = favData[indexPath.row].url
        vc?.sharedurl = favData[indexPath.row].url
        vc?.favbtnbool = true
        self.navigationController?.pushViewController(vc!, animated: true)
        //let selectnew = news[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)

        
    }
    
}
