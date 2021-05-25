//
//  FavoritesTableViewCell.swift
//  AppcentNewsApp
//
//  Created by Hasan Dag on 25.05.2021.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {

    @IBOutlet weak var newsImg: UIImageView!
    
    @IBOutlet weak var newsText: UITextView!
    
    
    @IBOutlet weak var newsTitle: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
