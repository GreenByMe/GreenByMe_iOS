//
//  UserMissionViewController.swift
//  greenByMe2
//
//  Created by 김태훈 on 2020/11/16.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
class UserMissionViewController: UIViewController {
  @IBOutlet weak var personalMissions: UICollectionView!
  let viewModel = UserMissionViewModel()
  
  @IBOutlet weak var addCampainBtn: UIButton!
  @IBAction func goBack(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
  }
  private let identifier : String = "userMissionVC"
    override func viewDidLoad() {
        super.viewDidLoad()
      viewModel.getPersonalMissionList()
      bindViewModel()
        // Do any additional setup after loading the view.
    }
  func bindViewModel() {
    viewModel.userMissionPublish.observeOn(MainScheduler.instance)
      .bind(to : personalMissions.rx.items(cellIdentifier: "missionsDetail", cellType: PersonalMissionCollectionViewCell.self)) {
        (index, data, cell) in
        cell.missionImg.image = getimg(data.missionPictureURL)
        cell.missionTitle.text = data.missionTitle
        cell.numbers.text = "\(data.manyPeople)"
        cell.progressStatus.text = "\(data.progress)"
    }
    let layout : UICollectionViewFlowLayout
    func getimg(_ url : String) -> UIImage {
      let url = URL(string: url)
      let img = try! Data(contentsOf: url!)
      let imgloaded : UIImage = UIImage(data: img)!
      return UIImage(data: img)!
    }
  }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
