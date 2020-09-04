//
//  HomeViewController.swift
//  GreenByMe
//
//  Created by 김태훈 on 2020/09/02.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx
class HomeViewController : UIViewController {
  var viewModel = HomeViewModel(storage: MissionStorage())
    override func viewDidLoad() {
        super.viewDidLoad()
      bindViewModel()
        // Do any additional setup after loading the view.
    }
  
  func bindViewModel() {
    let layout = popularMissionCollectionView.collectionViewLayout as? UICollectionViewFlowLayout
    layout?.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    layout?.minimumInteritemSpacing = 10
    viewModel.popularMissionList.bind(to :
    popularMissionCollectionView.rx.items(cellIdentifier: PopularCollectionViewCell.identifier, cellType: PopularCollectionViewCell.self)) { row, cellModel, cell in
      cell.missionName.text = cellModel.missionName
      cell.missionDuration.text = cellModel.startDate + "  " + cellModel.endDate
      cell.certificationCount.text = String(cellModel.passCandidateCount)
      cell.missionImg.image = cellModel.missionImg
      cell.backgroundColor = .brown
    }
    .disposed(by: rx.disposeBag)

  }
  @IBOutlet weak var userName: UILabel!
  @IBOutlet weak var totalExpectTree: UILabel!
  @IBOutlet weak var userCampainCount: UILabel!
  @IBOutlet weak var userCarboonFootprint: UILabel!
  @IBOutlet weak var userTree: UILabel!
  @IBOutlet weak var popularMissionCollectionView: UICollectionView!
  
  @IBOutlet weak var userMissionCollectionView: UICollectionView!
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
