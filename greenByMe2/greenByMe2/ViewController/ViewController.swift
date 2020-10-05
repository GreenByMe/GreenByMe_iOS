//
//  ViewController.swift
//  greenByMe2
//
//  Created by 김태훈 on 2020/10/05.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

class ViewController: UIViewController {
  let viewModel : ViewModel = ViewModel()
  
  @IBOutlet weak var PopularMissions: UICollectionView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    bindViewModel()
    // Do any additional setup after loading the view.
  }
  func bindViewModel() {
//    let layout = PopularMissions.collectionViewLayout as? UICollectionViewFlowLayout
//    layout?.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
//    layout?.minimumInteritemSpacing = 10
    viewModel.getMissions()
    viewModel.loadPopular().bind(to: PopularMissions.rx.items(cellIdentifier: "cell", cellType: PopularMissionCollectionViewCell.self)) { (index, data, cell) in
      cell.Title.text = data.title
      cell.subTitle.text = data.subject
      cell.missionImg.image = self.getimg(data.missionPictureUrl)
    }.disposed(by: rx.disposeBag)
    
  }
  func getimg(_ url : String) -> UIImage {
    let url = URL(string: url)
    let img = try! Data(contentsOf: url!)
    return UIImage(data: img)!
  }
}

