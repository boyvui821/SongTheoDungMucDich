//
//  ContentTableViewCell.swift
//  SongTheoDungMucDich
//
//  Created by Nguyen Hieu Trung on 4/20/18.
//  Copyright © 2018 NHTSOFT. All rights reserved.
//

import UIKit

class ContentTableViewCell: UITableViewCell {

    @IBOutlet weak var ImgContent: UIImageView!
    
    @IBOutlet weak var lblContentName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
