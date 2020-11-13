//
//  PopularMissionTableViewCell.swift
//  greenByMe2
//
//  Created by 김태훈 on 2020/10/06.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class PopularMissionTableViewCell: UITableViewCell {

  @IBOutlet weak var rank: UILabel!
  @IBOutlet weak var missionImg: UIImageView!
  @IBOutlet weak var title: UILabel!
  @IBOutlet weak var hashtag: UILabel!
  @IBOutlet weak var duration: UILabel!
  
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
