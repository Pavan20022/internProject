//
//  FavTableViewCell.swift
//  internProject
//
//  Created by Pavan D J on 07/04/22.
//

import UIKit

class FavTableViewCell: UITableViewCell {

    @IBOutlet weak var branchLabel: UILabel!
    @IBOutlet weak var cgpaLabel: UILabel!
    @IBOutlet weak var usnLabelField: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
