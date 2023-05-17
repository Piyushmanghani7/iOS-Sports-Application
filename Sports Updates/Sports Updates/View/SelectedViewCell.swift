//
//  SelectedViewCell.swift
//  Sports Updates
//
//  Created by on 3/23/23.
//

import UIKit

class SelectedViewCell: UITableViewCell {

    
    @IBOutlet weak var Favoriteteam: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
