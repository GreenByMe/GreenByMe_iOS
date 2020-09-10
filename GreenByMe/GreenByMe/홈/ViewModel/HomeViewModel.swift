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
import RxDataSources


class HomeCommonViewModel : NSObject {
  let storage : MissionStorageType
  init(storage : MissionStorageType) {
    self.storage = storage
  }
}
class HomeViewModel : HomeCommonViewModel{
  let disposeBag = DisposeBag()
  //var vc = HomeViewController?.self
  private var popMissions : [Mission] = []
  
  var completionHandler : [() -> Void] = []
  
  var getPopularMissions :[Mission] {
    switch PopularMission.shared.getPopularMissions() {
    case .success(let data) :
      var temp : [Mission] = []
      let data = data as! MissionInfo
      for contents in data.contents {
        let tempMission = Mission(missionName: contents.subject, category: .ALL, missionId: contents.missionId, dateCategory: .ALL, missionDescription: contents.description, expectTree: contents.expectTree, expectCo2: contents.expectCo2, missionImg: UIImage(), startDate: "", endDate: "", passCandidateCount: contents.passCandidateCount, progressByMissionId: 0, id: "")
        temp.append(tempMission)
      }
      self.popMissions = temp
      temp.removeAll()
      self.storage.loadMission(missions: self.popMissions)
    case .netwrokFail : print("networkFail")
    case .pathErr : print("pathErr")
    case .serverErr : print("serverErr")
    case .requestErr( _) : print("requestErr")
    }
    print(popMissions)
    return popMissions
  }
  //private let popularService : PopularMissionApi
  let service = PopularMissionService.shared
  
  func process() -> Void {
    self.service
      .fetchMissions()
    .map({ (popmissions) in
      var temp : [Mission] = []
      for contents in popmissions.data.contents {
         let tempMission = Mission(missionName: contents.subject, category: .ALL, missionId: contents.missionID, dateCategory: .ALL, missionDescription: contents.contentDescription, expectTree: contents.expectTree, expectCo2: contents.expectCo2, missionImg: UIImage(), startDate: "", endDate: "", passCandidateCount: contents.passCandidatesCount, progressByMissionId: 0, id: "")
        temp.append(tempMission)
      }
      self.popMissions = temp
    })
    .subscribe()
    .disposed(by: disposeBag)
  }
  var userMissionList : Observable<[Mission]> {
    return storage.callmissionList()
  }
  var popularMissionList : Observable<[Mission]> {
//    print(getPopularMissions)
//    dump(storage)
//    print(completionHandler)
    return storage.callmissionList()
  }
  var userMissionCount : Int {
    return storage.count()
  }
  
  private var mission : MissionInfo? {
    didSet {
      guard let m = mission else {return}
      self.didFinishFetch?()
    }
  }
  
  var error :Error? {
    didSet{self.showAlertClosure?()}
  }
  var isLoading : Bool = false {
    didSet {self.updateLoadinngStatus?()}
  }
  private var dataService : PopularMission?
  
  var showAlertClosure : (() -> ())?
  var updateLoadinngStatus : (() -> ())?
  var didFinishFetch : (() -> ())?
  
  init(dataService : PopularMission) {
    self.dataService = dataService
  }
  func fetchMission() {
    self.dataService?.getPopularMissions(completion: { (networkResult) in
      switch networkResult {
      case .success(let data) :
        self.error = nil
        self.isLoading = false
        self.mission = data as! MissionInfo
      case .netwrokFail :
        print("networkFail")
        self.isLoading = false
      case .pathErr :
        print("pathErr")
        self.isLoading = false
      case .serverErr :
        print("serverErr")
        self.isLoading = false

      case .requestErr( _) :
        print("requestErr")
        self.isLoading = false

      }
    })

  }
  private func setUpCell(with missionInfo : MissionInfo) {
    if let 
  }
  
  
}

