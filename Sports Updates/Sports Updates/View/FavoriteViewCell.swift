//
//  FavoriteViewCell.swift
//  Sports Updates
//
//  Created by  on 3/3/23.
//

import UIKit

class FavoriteViewCell: UITableViewCell {
    @IBOutlet weak var teamimage: UIImageView!
    
    @IBOutlet weak var nameimage: UIImageView!
    
    
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var favorite: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
