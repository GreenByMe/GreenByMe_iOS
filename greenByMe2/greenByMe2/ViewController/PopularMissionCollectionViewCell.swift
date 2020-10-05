//
//  PopularMissionCollectionViewCell.swift
//  greenByMe2
//
//  Created by 김태훈 on 2020/10/05.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class PopularMissionCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var subTitle: UILabel!
  @IBOutlet weak var Title: UILabel!
  @IBOutlet weak var missionImg: UIImageView!
  var viewModel : Mission? {
    didSet {
      bindViewModel()
    }
  }
  private func bindViewModel() {
    Title?.text = viewModel?.title
    subTitle?.text = viewModel?.subject
  }
}
