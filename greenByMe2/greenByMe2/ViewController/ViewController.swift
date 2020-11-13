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
  
  var viewModel : ViewModel = ViewModel(MissionStorage())
  var missions : [Mission] = []
  @IBOutlet weak var PopularMissions: UICollectionView!
  @IBAction func gotoDetailView(_ sender: Any) {
    guard let navi = storyboard?.instantiateViewController(withIdentifier: "detailview") as? UINavigationController else {fatalError()}
    self.present(navi, animated: true, completion: nil)
  }
  override func viewDidLoad() {
    super.viewDidLoad()

    bindViewModel()
    viewModel.getMissions2()
    
    // Do any additional setup after loading the view.
  }
  func getimg(_ url : String) -> UIImage {
    let url = URL(string: url)
    let img = try! Data(contentsOf: url!)
    return UIImage(data: img)!
  }
  private func bindViewModel(){
    viewModel.missions.observeOn(MainScheduler.instance)
      .bind(to: PopularMissions.rx.items(cellIdentifier: "cell", cellType: PopularMissionCollectionViewCell.self)) { (index, data, cell) in
        cell.Title.text = data.title
        cell.subTitle.text = data.subject
        cell.missionImg.image = self.getimg(data.missionPictureUrl)
        self.missions.append(data)
      }.disposed(by: rx.disposeBag)
  }

}
