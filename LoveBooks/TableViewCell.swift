//
//  TableViewCell.swift
//  LoveBooks
//
//  Created by jk on 2016/9/29.
//  Copyright © 2016年 jk. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var booksImage: UIImageView!

    @IBOutlet weak var booksName: UILabel!
    
    @IBOutlet weak var booksDetail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
