//
//  PopularCollectionViewCell.swift
//  GreenByMe
//
//  Created by 김태훈 on 2020/09/04.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var missionImg: UIImageView!
  @IBOutlet weak var missionName: UILabel!
  @IBOutlet weak var missionDuration: UILabel!
  @IBOutlet weak var certificationCount: UILabel!
  static let identifier = "popularMissionCell"
}
