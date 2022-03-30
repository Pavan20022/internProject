//
//  TableViewCell.swift
//  internProject
//
//  Created by Pavan D J on 30/03/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var labelBranch: UILabel!
    @IBOutlet weak var labelName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
