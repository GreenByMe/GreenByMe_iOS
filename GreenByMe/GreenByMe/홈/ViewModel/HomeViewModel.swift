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
  var popularMission : [Mission] {
    var mission : [Mission] = []
    PopularMission.shared.getPopularMissions() {
      networkResult in
      switch networkResult {
      case .success(let data):
        guard let data = data as? MissionInfo  else { return}
        let temp = data.contents
        var popMission : [Mission] = []
        for content in temp {
          popMission.append(Mission(missionName: content.subject, category: .ALL, missionId: content.missionId, dateCategory: .ALL, missionDescription: content.description, expectTree: content.expectTree, expectCo2: content.expectCo2, missionImg: UIImage() , startDate: "", endDate: "", passCandidateCount: content.passCandidateCount, progressByMissionId: 0))
        }
        mission = popMission
        self.storage.loadMission(missions: popMission)
        dump(self.storage)
      case .pathErr : print("pathErr")
      case .serverErr : print("serverErr")
      case .netwrokFail: print("networkFail")
      case .requestErr(let message):
        print(message)
      }
    }
    dump(PopularMission.shared.completionHandler)
    PopularMission.shared.completionHandler[0](.success(MissionInfo()))
    return mission
  }
  var popularMissionList : Observable<[Mission]> {
    dump(popularMission)
    return storage.callmissionList()
  }
  var userMissionCount : Int {
    return storage.count()
  }
}

