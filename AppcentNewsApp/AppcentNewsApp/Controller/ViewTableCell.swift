//
//  ViewTableCell.swift
//  AppcentNewsApp
//
//  Created by Hasan Dag on 22.05.2021.
//

import UIKit

class ViewTableCell: UITableViewCell {

    @IBOutlet weak var newsTitle: UIButton!
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var textField: UITextView!
    var nwmodel : News?
    
    let imgNetwork = NetworkManager()
    override func awakeFromNib() {
        super.awakeFromNib()
        
       /* imgNetwork.getImage(urlString:(self.nwmodel?.urlToImage)!) { (data) in
            guard let dataimg = data else {return}
            //guard let urll = self.nwmodel?.urlToImage else{return}
            DispatchQueue.main.async {
                
                imgNetwork.imageCache = <nwmodel?.urlToImage; , dataimg>
            }
        }*/
        // Cache 
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func titleClicked(_ sender: UIButton) {
    }
    
}
