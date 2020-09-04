//
//  HomeViewModel.swift
//  GreenByMe
//
//  Created by 김태훈 on 2020/09/03.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import Action
class HomeCommonViewModel : NSObject {
  let storage : MissionStorageType
  init(storage : MissionStorageType) {
    self.storage = storage
  }
}
class HomeViewModel : HomeCommonViewModel{
  var userMissionList : Observable<[Mission]> {
    return storage.callmissionList()
  }
  var popularMission : [Mission] = []
  var popularMissionList : Observable<[Mission]> {
    PopularMission.shared.getPopularMissions() {
      networkResult in
      switch networkResult {
      case .success(let data):
        guard let data = data as? MissionInfo  else {print("여기?"); return}
        let temp = data.contents
        var popMission : [Mission] = []
        for content in temp {
          popMission.append(Mission(missionName: content.subject, category: .ALL, missionId: content.missionId, dateCategory: .ALL, missionDescription: content.description, expectTree: content.expectTree, expectCo2: content.expectCo2, missionImg: UIImage() , startDate: "", endDate: "", passCandidateCount: content.passCandidateCount, progressByMissionId: 0))
        }
        print(popMission)
        self.popularMission.append(contentsOf: popMission)
      case .pathErr : print("pathErr")
      case .serverErr : print("serverErr")
      case .netwrokFail: print("networkFail")
      case .requestErr(let message):
        print(message)
      }
    }
    storage.loadMission(missions: popularMission)
    dump(popularMission)

    return storage.callmissionList()
  }
  var userMissionCount : Int {
    return storage.count()
  }
}
