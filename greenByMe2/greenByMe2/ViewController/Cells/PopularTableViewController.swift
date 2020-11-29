//
//  PopularTableViewController.swift
//  greenByMe2
//
//  Created by 김태훈 on 2020/10/06.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class PopularTableViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  let viewModel : PopularMissionsViewModel = PopularMissionsViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
      viewModel.getPopularMissionList()
      bindViewModel()
      
        // Do any additional setup after loading the view.
    }
  @IBAction func backBtn(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
  }
  func bindViewModel() {
    viewModel.popularMissions.observeOn(MainScheduler.instance)
      .bind(to: tableView.rx.items(cellIdentifier: "tablecell", cellType: PopularMissionTableViewCell.self)) { (index, data, cell) in
      print(data)
        cell.title.text = data.subject
        cell.rank.text = String(index + 1)
        if index < 3 {
          cell.rank.textColor = .orange
        }
        cell.missionImg.contentMode = .scaleToFill
        cell.missionImg.image = getimg(data.missionPictureURL)
        cell.duration.text = data.dayCategory + " | \(data.passCandidatesCount)"
    }.disposed(by: rx.disposeBag)
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
