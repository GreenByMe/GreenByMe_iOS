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
  let viewModel : ViewModel = ViewModel(MissionStorage())
    override func viewDidLoad() {
        super.viewDidLoad()
      bindViewModel()
        // Do any additional setup after loading the view.
    }
  func bindViewModel() {
    viewModel.popularMissionList.bind(to: tableView.rx.items(cellIdentifier: "tablecell", cellType: PopularMissionTableViewCell.self)) { (index, data, cell) in
      print(data)
      cell.title.text = data.title
      cell.rank.text = String(index)
      cell.missionImg.image = getimg(data.missionPictureUrl)
      cell.duration.text = data.dayCategory + " | \(data.passCandidateCount)"
    }.disposed(by: rx.disposeBag)
    
    func getimg(_ url : String) -> UIImage {
      let url = URL(string: url)
      let img = try! Data(contentsOf: url!)
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
