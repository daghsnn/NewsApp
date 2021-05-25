//
//  DetailsViewController.swift
//  AppcentNewsApp
//
//  Created by Hasan Dag on 23.05.2021.
//

import UIKit
import Kingfisher



class DetailsViewController: UIViewController {
    
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var shareBtn: UIButton!
    
    @IBOutlet weak var detailImg: UIImageView!
    
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailTextView: UITextView!
    
    @IBOutlet weak var authorName: UILabel!
    
    @IBOutlet weak var newsDate: UILabel!
    var favbtnbool = false
    let networksave = NetworkManager()

    
    var authorname : String?
    var image = UIImage()
    var date : String?
    var descript :String?
    var titledt :String?
    var sendedurl : String?
    var imageUrl : String?
    var sharedurl : Any?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailImg.kf.setImage(with: URL(string: imageUrl ?? "https://www.publicdomainpictures.net/en/view-image.php?image=270609&picture=not-found-image"))
        authorName.text = authorname
        let parsestringdate = date
        newsDate.text = String((parsestringdate?.prefix(10))!)
        detailTitle.text = titledt
        detailTextView.text = descript
        
       

        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "towebkit" {
            let webbVC = segue.destination as! WebKitViewController
            webbVC.weburl = sendedurl
                    
                   
                }
    }
    @IBAction func shareBtn(_ sender: Any) {
            let share: [Any] = [URL(string:sharedurl! as! String)]
            
            let ac = UIActivityViewController(activityItems: share, applicationActivities: nil)
            present(ac, animated: true)
        }
        
        
  
    @IBAction func favoriBtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "favoriteVC") as? FavoritesViewController
        let newsfav = [NewsFav.init(author1: self.authorname!, title1: self.titledt!, description1: self.descript!, url1:self.sendedurl!, urlToImage1: self.imageUrl!, publishedAt1: self.date!)]
        
        
        
        if favbtnbool == false {
            
            vc?.favData.append(contentsOf: newsfav)
            favbtnbool = true
            likeBtn.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            
        }
        else{
            vc?.favData.remove(at: Int(newsfav.count+1))
            favbtnbool = false
            likeBtn.setImage(UIImage(systemName: "heart"), for: .normal)

        }
    
    }
    
    
    @IBAction func sourceClick(_ sender: Any) {
        performSegue(withIdentifier: "towebkit", sender: nil)
        
    }
    
}
