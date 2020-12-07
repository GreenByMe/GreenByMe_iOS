//
//  MissionDetailViewController.swift
//  greenByMe2
//
//  Created by 김태훈 on 2020/12/07.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit

class MissionDetailViewController: UIViewController {
  @IBOutlet weak var backgroundImg: UIImageView!
  @IBOutlet weak var missionTitle: UILabel!
  @IBOutlet weak var missionDuration: UILabel!
  @IBOutlet weak var participants: UILabel!
  @IBOutlet weak var category: UILabel!
  @IBOutlet weak var progressRate: UILabel!
  
  
  
  let identifier : String = "MissionDetailVC"
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
