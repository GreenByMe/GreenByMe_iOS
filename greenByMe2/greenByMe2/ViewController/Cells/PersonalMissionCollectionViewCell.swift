//
//  PersonalMissionCollectionViewCell.swift
//  greenByMe2
//
//  Created by 김태훈 on 2020/11/17.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class PersonalMissionCollectionViewCell: UICollectionViewCell {
  private let identifier : String = "missionsDetail"
  
  @IBOutlet weak var numbers: UILabel!
  @IBOutlet weak var progressStatus: UILabel!
  @IBOutlet weak var missionTitle: UILabel!
  @IBOutlet weak var missionImg: UIImageView!
}
