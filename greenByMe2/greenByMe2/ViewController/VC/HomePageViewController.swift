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

class HomePageViewController: UIViewController {
  @IBOutlet weak var userNAme: UILabel!
  @IBOutlet weak var userTree: UILabel!
  @IBOutlet weak var userCampain: UILabel!
  @IBOutlet weak var userFootprint: UILabel!
  @IBOutlet weak var savedTree: UILabel!
  @IBOutlet weak var homePageMainView: UIView!
  @IBOutlet weak var personalMissionCollectionView: UICollectionView!
  @IBOutlet weak var progressRate: NSLayoutConstraint!
  @IBOutlet weak var PopularMissions: UICollectionView!
  @IBAction func gotoDetailView(_ sender: Any) {
    guard let navi = self.storyboard?.instantiateViewController(withIdentifier: "detailView") as? PopularTableViewController else {return}
    self.navigationController?.pushViewController(navi, animated: true)
    //self.push(navi, animated: true, completion: nil)
  }
  public let hompage = PublishSubject<UserHomePageDetailDto>()
  var viewModel : HomeViewModel = HomeViewModel(MissionStorage())
  var popularMissions : [PopularMissionHomePageResponseDto] = []
  var personalMissions : [PersonalMissionHomePageDto] = []
  override func viewDidLoad() {
    super.viewDidLoad()
    bindViewModel()
    viewModel.getHomePageInfo()
    // Do any additional setup after loading the view.
  }
  func getimg(_ url : String) -> UIImage {
    let url = URL(string: url)
    let img = try! Data(contentsOf: url!)
    return UIImage(data: img)!
  }
  private func bindViewModel(){
    viewModel.personalMissions.observeOn(MainScheduler.instance).bind(to: personalMissionCollectionView.rx.items(cellIdentifier : "mymissionCell", cellType: MyMissionCollectionViewCell.self)) { (index,data,cell ) in
      cell.Title.text = data.missionTitle
      cell.date.text = data.startDate
      cell.missionImg.image = self.getimg(data.pictureURL)
      cell.people.text = "\(data.manyPeople)명 도전중"
      self.personalMissions.append(data)
    }.disposed(by: rx.disposeBag)
    
    viewModel.popularMissions.observeOn(MainScheduler.instance)
      .bind(to: PopularMissions.rx.items(cellIdentifier: "cell", cellType: PopularMissionCollectionViewCell.self)) { (index, data, cell) in
        cell.Title.text = data.subject
        cell.subTitle.text = data.subject
        cell.missionImg.image = self.getimg(data.pictureURL)
        self.popularMissions.append(data)
    }.disposed(by: rx.disposeBag)
    
    viewModel.homePageDto.observeOn(MainScheduler.instance).subscribe(onNext: {(home) in
      self.userNAme.text = "안녕하세요 \(home.nickName)님"
      var sentence : String = home.treeSentence
      sentence = sentence.replacingOccurrences(of: "<br><b><font color=\"#26B679\">", with: "\n")
      sentence = sentence.replacingOccurrences(of: "</font></b>", with: "")
      self.userTree.text = "\(sentence)"
      self.userCampain.text = "\(home.progressCampaign)"
      self.userFootprint.text = "\(home.expectedCO2)"
      self.savedTree.text = "\(home.expectedTree)"
      self.progressRate.constant = 328.0 * CGFloat(home.progressRates) / 328.0
    }).disposed(by: rx.disposeBag)
  }
}
