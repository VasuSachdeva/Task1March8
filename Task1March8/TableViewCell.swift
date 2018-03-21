//
//  TableViewCell.swift
//  Task1March8
//
//  Created by MAC on 08/03/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

	@IBOutlet weak var namelabel: UILabel!
	@IBOutlet weak var agelabel: UILabel!
	@IBOutlet weak var emaillabel: UILabel!
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
